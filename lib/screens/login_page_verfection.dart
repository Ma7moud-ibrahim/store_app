import 'package:app_store/screens/register_page.dart';
import 'package:app_store/widget/custom_button.dart';
import 'package:app_store/widget/phone_number_text_feild.dart';
import 'package:app_store/widget/verfection.dart';
import 'package:flutter/material.dart' hide Size;

class LoginPageVerfection extends StatelessWidget {
  bool isLoading = false;
  String? email, password;
  static String id = 'LoginPageVerfection';
  final GlobalKey<FormState> formKey = GlobalKey();

  LoginPageVerfection({super.key});

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
                'Enter Verifiection Code',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 28,
                  fontFamily: 'Pacifico',
                ),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 30),
              Text(
                'We have to sent SMS to :  \n010sssssssssssss',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 35),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Resend OTP',
                    style: TextStyle(
                      color: Colors.orange,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    'Change Phone Number',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
              SizedBox(height: 20),
              verifiectionMethoud(),

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

              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
