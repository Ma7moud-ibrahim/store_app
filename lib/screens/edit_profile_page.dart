import 'dart:io';

import 'package:app_store/models/user_profile.dart';
import 'package:app_store/screens/bottom_navigation_bar.dart';
import 'package:app_store/widget/custom_button.dart';
import 'package:app_store/widget/custom_text_feild.dart';
import 'package:app_store/widget/image_picker_avatar.dart';
import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});
  static final String id = "EditProfilePage";
  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  bool isLoading = false;

  String? name;
  File? profileImage;
  String? password;

  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController nameController = TextEditingController(
    text: UserProfile.name ?? '',
  );
  final TextEditingController phoneController = TextEditingController(
    text: UserProfile.phone,
  );
  final TextEditingController passwordController = TextEditingController(
    text: UserProfile.password,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Profile',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: formKey,
          child: ListView(
            physics: const NeverScrollableScrollPhysics(),
            children: [
              const SizedBox(height: 25),
              Center(
                child: ImagePickerAvatar(
                  size: 130,
                  placeholderIcon: Icons.add_a_photo_outlined,
                  initialImage: profileImage ?? UserProfile.image,
                  onImagePicked: (file) {
                    setState(() {
                      profileImage = file;
                      UserProfile.image = file;
                    });
                  },
                ),
              ),
              const SizedBox(height: 30),

              CustomTextField(
                label: 'Full Name',
                controller: nameController,
                iconPrefix: const Icon(Icons.person),
              ),
              const SizedBox(height: 12),

              CustomTextField(
                label: 'Password',
                controller: passwordController,
                iconPrefix: const Icon(Icons.password),
              ),
              const SizedBox(height: 12),

              CustomTextField(
                label: 'Phone Number',
                controller: phoneController,
                iconPrefix: const Icon(Icons.call),
              ),
              const SizedBox(height: 320),

              CustomButton(
                text: 'Save',
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    UserProfile.save(
                      userName: nameController.text,
                      userImage: profileImage,
                      userPassword: passwordController.text,
                      userPhone: phoneController.text,
                    );

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NavigationBarScreens(),
                      ),
                    );
                  }
                },
                color: Colors.green,
                icon: Icons.save,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
