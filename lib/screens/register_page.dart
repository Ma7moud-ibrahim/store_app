import 'package:app_store/widget/custom_button.dart';
import 'package:app_store/widget/custom_text_feild.dart';
import 'package:flutter/material.dart' hide Size;

class RegisterPage extends StatelessWidget {
  bool isLoading = false;
  String? name;
  static String id = 'RegisterPage';
  final GlobalKey<FormState> formKey = GlobalKey();

  RegisterPage({super.key});

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
              SizedBox(
                height: 150,
                width: 100,
                child: Icon(Icons.add_a_photo_outlined, size: 130),
              ),
              CustomButton(
                text: 'Sync From Facebook',
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                  } else {}
                },
                color: Colors.blue,
                icon: Icons.facebook,
              ),
              const SizedBox(height: 32),
              CustomTextField(
                label: 'Full Name',
                iconPrefix: const Icon(Icons.person),
              ),
              const SizedBox(height: 340),

              CustomButton(
                text: 'Next',
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                  } else {}
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
