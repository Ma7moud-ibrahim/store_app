import 'package:app_store/screens/register_page.dart';
import 'package:app_store/widget/custom_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class LoginPageVerfection extends StatefulWidget {
  const LoginPageVerfection({super.key});

  static String id = 'LoginPageVerfection';

  @override
  State<LoginPageVerfection> createState() => _LoginPageVerfectionState();
}

class _LoginPageVerfectionState extends State<LoginPageVerfection> {
  String smsCode = '';
  bool isLoading = false;

  Future<void> verifyOtp(String verificationId) async {
    if (smsCode.length != 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter the complete verification code'),
        ),
      );

      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      final credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsCode,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);

      if (!mounted) return;

      setState(() {
        isLoading = false;
      });

      Navigator.pushReplacementNamed(context, RegisterPage.id);
    } on FirebaseAuthException catch (e) {
      if (!mounted) return;

      setState(() {
        isLoading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message ?? 'Invalid verification code')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final verificationId = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Verification'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            const Text(
              'Enter verification code',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            const Text(
              'We sent a verification code to your phone number.',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w300),
            ),

            const SizedBox(height: 40),

            Pinput(
              length: 6,
              keyboardType: TextInputType.number,

              onChanged: (value) {
                smsCode = value;
              },

              onCompleted: (value) {
                smsCode = value;
              },

              defaultPinTheme: PinTheme(
                width: 55,
                height: 55,

                textStyle: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),

                decoration: BoxDecoration(
                  color: const Color(0xFFF1F2F4),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),

              focusedPinTheme: PinTheme(
                width: 55,
                height: 55,

                textStyle: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),

                decoration: BoxDecoration(
                  color: const Color(0xFFF1F2F4),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.green),
                ),
              ),
            ),

            const SizedBox(height: 40),

            CustomButton(
              text: isLoading ? 'Verifying...' : 'Verify',

              onPressed: isLoading
                  ? null
                  : () async {
                      await verifyOtp(verificationId);
                    },

              color: Colors.green,
              icon: Icons.check,
            ),
          ],
        ),
      ),
    );
  }
}
