import 'package:app_store/widget/constant.dart';
import 'package:app_store/widget/custom_button.dart';
import 'package:app_store/widget/custom_text_feild.dart';
import 'package:flutter/material.dart' hide Size;

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});

  static String id = 'registerPage';

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String? email, password;
  bool isLoading = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              SizedBox(
                height: 160,
                child: Image.asset("assets/images/scholar.png"),
              ),
              Text(
                'Scholar Chat',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontFamily: 'Pacifico',
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              Text(
                'REGISTER',
                style: TextStyle(color: Colors.white, fontSize: 35),
                textAlign: TextAlign.start,
              ),
              CustomTextField(
                label: 'Email',
                onChanged: (value) {
                  email = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              CustomTextField(
                label: 'Password',
                obscureText: true,
                onChanged: (value) {
                  password = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              CustomButton(
                text: 'REGISTER',
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
                    'already have an account?',
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(color: Color(0xffC7EDE6), fontSize: 17),
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
