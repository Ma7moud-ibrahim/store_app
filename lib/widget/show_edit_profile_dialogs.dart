import 'package:flutter/material.dart';

class ShowEditProfileDialogs extends StatefulWidget {
  const ShowEditProfileDialogs({
    super.key,
    required this.nameUser,
    required this.phoneUser,
    required this.onUpdate,
  });

  final String nameUser;
  final String phoneUser;

  final Function(String name, String phone) onUpdate;

  @override
  State<ShowEditProfileDialogs> createState() => _ShowEditProfileDialogsState();
}

class _ShowEditProfileDialogsState extends State<ShowEditProfileDialogs> {
  late TextEditingController nameController;
  late TextEditingController phoneController;

  @override
  void initState() {
    super.initState();

    nameController = TextEditingController(text: widget.nameUser);

    phoneController = TextEditingController(text: widget.phoneUser);
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Edit Profile'),

      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: nameController,
            decoration: const InputDecoration(labelText: 'Enter your name'),
          ),

          const SizedBox(height: 15),

          TextField(
            controller: phoneController,
            keyboardType: TextInputType.phone,
            decoration: const InputDecoration(labelText: 'Enter your phone'),
          ),
        ],
      ),

      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Cancel'),
        ),

        ElevatedButton(
          onPressed: () {
            widget.onUpdate(nameController.text, phoneController.text);

            Navigator.pop(context);
          },
          child: const Text('Update'),
        ),
      ],
    );
  }
}
