import 'package:app_store/screens/register_page.dart';
import 'package:app_store/widget/custom_button.dart';
import 'package:app_store/widget/phone_number_text_feild.dart';
import 'package:flutter/material.dart' hide Size;

class LoginPage extends StatelessWidget {
  bool isLoading = false;
  String? email, password;
  static String id = 'loginPage';
  final GlobalKey<FormState> formKey = GlobalKey();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              SizedBox(
                height: 400,
                width: 100,
                child: Image.asset(
                  "lib/assets/images/undraw_personalization_triu.png",
                ),
              ),
              Text(
                'Enter your mobile number',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 28,
                  fontFamily: 'Pacifico',
                ),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 30),
              Text(
                'We need to verify you. We will send you a one time verification code',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                ),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 35),

              PhoneNumberField(),
              SizedBox(height: 50),

              CustomButton(
                text: 'Next',
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                  } else {}
                },
                color: Colors.green,
                icon: Icons.arrow_forward,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'don`t have an account?',
                    style: TextStyle(color: Colors.black, fontSize: 17),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, RegisterPage.id);
                    },
                    child: Text(
                      'Register',
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
