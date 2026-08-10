import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

Pinput verifiectionMethoud() {
  return Pinput(
    length: 5,

    keyboardType: TextInputType.number,

    defaultPinTheme: PinTheme(
      width: 55,
      height: 55,
      textStyle: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      decoration: BoxDecoration(
        color: const Color(0xFFF1F2F4),
        borderRadius: BorderRadius.circular(8),
      ),
    ),

    focusedPinTheme: PinTheme(
      width: 55,
      height: 55,
      textStyle: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      decoration: BoxDecoration(
        color: const Color(0xFFF1F2F4),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.blue),
      ),
    ),

    onCompleted: (value) {
      print('Verification code: $value');
    },
  );
}
