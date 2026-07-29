import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
    required this.label,
    this.controller,
    this.onChanged,
    this.inputType,
  });
  final String label;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final TextInputType? inputType;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: inputType,
      onChanged: onChanged,
      cursorColor: const Color.fromRGBO(94, 82, 82, 1),
      decoration: InputDecoration(
        label: Text(label),
        labelStyle: TextStyle(
          color: const Color.fromARGB(255, 98, 90, 90),
          fontSize: 20,
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Color.fromARGB(255, 98, 90, 90)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),

          borderSide: BorderSide(color: Color.fromARGB(255, 98, 90, 90)),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),

          borderSide: BorderSide(color: Color.fromARGB(255, 98, 90, 90)),
        ),
      ),
    );
  }
}
