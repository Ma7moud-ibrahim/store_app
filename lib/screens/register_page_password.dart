import 'package:app_store/widget/custom_button.dart';
import 'package:app_store/widget/custom_text_feild.dart';
import 'package:flutter/material.dart' hide Size;

class RegisterPagePassword extends StatelessWidget {
  bool isLoading = false;
  String? password;
  static String id = 'RegisterPagePassword';
  final GlobalKey<FormState> formKey = GlobalKey();

  RegisterPagePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Choose a Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: formKey,
          child: ListView(
            physics: const NeverScrollableScrollPhysics(),
            children: [
              const SizedBox(height: 15),

              Text(
                'For the security & safety please choose a password',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                ),
                textAlign: TextAlign.start,
              ),
              SizedBox(
                height: 300,
                width: 100,
                child: Image.asset('lib/assets/images/login-pana.png'),
              ),

              const SizedBox(height: 32),
              CustomTextField(
                label: 'Password',
                iconPrefix: const Icon(Icons.password_rounded),
                iconsufix: const Icon(Icons.remove_red_eye_rounded),
              ),
              const SizedBox(height: 15),
              CustomTextField(
                label: 'Confirm Password',
                iconPrefix: const Icon(Icons.password_rounded),
                iconsufix: const Icon(Icons.remove_red_eye_rounded),
              ),
              const SizedBox(height: 100),

              CustomButton(
                text: 'Finish, Good to go',
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                  } else {}
                },
                color: Colors.green,
                icon: Icons.arrow_forward,
              ),

              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
