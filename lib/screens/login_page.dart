import 'package:app_store/screens/login_page_verfection.dart';
import 'package:app_store/screens/register_page.dart';
import 'package:app_store/widget/custom_button.dart';
import 'package:app_store/widget/phone_number_text_feild.dart';
import 'package:country_picker/country_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart' hide Size;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static String id = 'loginPage';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController phoneController = TextEditingController();

  Country selectedCountry = Country(
    phoneCode: '20',
    countryCode: 'EG',
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: 'Egypt',
    example: '1001234567',
    displayName: 'Egypt',
    displayNameNoCountryCode: 'Egypt',
    e164Key: '',
  );

  bool isLoading = false;

  String get fullPhoneNumber {
    return '+${selectedCountry.phoneCode}${phoneController.text.trim()}';
  }

  Future<void> sendOtp() async {
    final phoneNumber = fullPhoneNumber;

    setState(() {
      isLoading = true;
    });

    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNumber,

        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance.signInWithCredential(credential);

          if (!mounted) return;

          setState(() {
            isLoading = false;
          });
        },

        verificationFailed: (FirebaseAuthException e) {
          if (!mounted) return;

          setState(() {
            isLoading = false;
          });

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(e.message ?? 'Phone verification failed')),
          );
        },

        codeSent: (String verificationId, int? resendToken) {
          if (!mounted) return;

          setState(() {
            isLoading = false;
          });

          Navigator.pushNamed(
            context,
            LoginPageVerfection.id,
            arguments: verificationId,
          );
        },

        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } catch (e) {
      if (!mounted) return;

      setState(() {
        isLoading = false;
      });

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

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
                height: 350,
                width: 100,
                child: Image.asset(
                  'lib/assets/images/undraw_personalization_triu.png',
                ),
              ),

              const Text(
                'Enter your mobile number',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 28,
                  fontFamily: 'Pacifico',
                ),
              ),

              const SizedBox(height: 25),

              const Text(
                'We need to verify you. We will send you a one time verification code',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                ),
              ),

              const SizedBox(height: 35),

              PhoneNumberField(
                controller: phoneController,
                onCountryChanged: (Country country) {
                  setState(() {
                    selectedCountry = country;
                  });
                },
              ),

              const SizedBox(height: 30),

              CustomButton(
                text: isLoading ? 'Sending...' : 'Next',
                onPressed: isLoading
                    ? null
                    : () async {
                        if (formKey.currentState!.validate()) {
                          await sendOtp();
                        }
                      },
                color: Colors.green,
                icon: Icons.arrow_forward,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'don`t have an account?',
                    style: TextStyle(color: Colors.black, fontSize: 17),
                  ),

                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, RegisterPage.id);
                    },
                    child: const Text(
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
