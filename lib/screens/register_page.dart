import 'package:app_store/models/user_profile.dart';
import 'package:app_store/screens/bottom_navigation_bar.dart';
import 'package:app_store/screens/profile_page.dart';
import 'package:app_store/widget/custom_button.dart';
import 'package:app_store/widget/custom_text_feild.dart';
import 'package:app_store/widget/image_picker_avatar.dart';
import 'package:flutter/material.dart' hide Size;
import 'dart:io';

class RegisterPage extends StatefulWidget {
  static String id = 'RegisterPage';
  RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool isLoading = false;

  String? name;
  File? profileImage;

  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Text('Your Information'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: formKey,
          child: ListView(
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Text(
                'It looks like you dont have account in this number. Please let us know some information for a scure service',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                ),
                textAlign: TextAlign.start,
              ),
              const SizedBox(height: 12),
              // هنا استبدلنا الـ GestureDetector بالـ widget الجاهز مباشرة
              Center(
                child: ImagePickerAvatar(
                  size: 130,
                  placeholderIcon: Icons.add_a_photo_outlined,
                  onImagePicked: (file) {
                    setState(() {
                      profileImage = file;
                    });
                  },
                ),
              ),
              const SizedBox(height: 12),
              CustomButton(
                text: 'Sync From Facebook',
                onPressed: () async {},
                color: Colors.blue,
                icon: Icons.facebook,
              ),
              const SizedBox(height: 32),
              CustomTextField(
                label: 'Full Name',
                controller: nameController,
                iconPrefix: const Icon(Icons.person),
              ),
              const SizedBox(height: 340),

              CustomButton(
                text: 'Next',
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    UserProfile.save(
                      userName: nameController.text,
                      userImage: profileImage,
                    );

                    // 2) نفتح صفحة المنتجات الرئيسية
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NavigationBarScreens(),
                      ), // غيّر HomePage لاسم صفحتك الحقيقي
                    );
                  }
                },
                color: Colors.green,
                icon: Icons.arrow_forward,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
