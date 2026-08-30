import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerAvatar extends StatefulWidget {
  final ValueChanged<File>? onImagePicked;
  final double size;
  final IconData placeholderIcon;
  final File? initialImage;

  const ImagePickerAvatar({
    super.key,
    this.onImagePicked,
    this.size = 120,
    this.placeholderIcon = Icons.add_a_photo,
    this.initialImage,
  });

  @override
  State<ImagePickerAvatar> createState() => _ImagePickerAvatarState();
}

class _ImagePickerAvatarState extends State<ImagePickerAvatar> {
  File? _selectedImage;

  @override
  void initState() {
    super.initState();
    _selectedImage = widget.initialImage;
  }

  Future<void> _pickImage() async {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('التقاط صورة من الكاميرا'),
                onTap: () => _handlePick(ImageSource.camera),
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('اختيار من المعرض'),
                onTap: () => _handlePick(ImageSource.gallery),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _handlePick(ImageSource source) async {
    Navigator.pop(context);
    final picked = await ImagePicker().pickImage(source: source);
    if (picked != null) {
      final file = File(picked.path);
      setState(() {
        _selectedImage = file;
      });
      widget.onImagePicked?.call(file);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _pickImage,
      child: _selectedImage != null
          ? ClipRRect(
              borderRadius: BorderRadius.circular(120),
              child: Image.file(
                _selectedImage!,
                width: widget.size,
                height: widget.size,
                fit: BoxFit.cover,
              ),
            )
          : Container(
              width: widget.size,
              height: widget.size,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(80),
              ),
              child: Icon(widget.placeholderIcon, size: widget.size * 0.33),
            ),
    );
  }
}
