import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.label,
    this.iconPrefix,
    this.controller,
    this.onChanged,
    this.inputType,
    this.validator,
    this.obscureText = false,
    this.iconsufix,
  });

  final String label;
  final Widget? iconPrefix;
  final Widget? iconsufix;

  final TextEditingController? controller;
  final Function(String)? onChanged;
  final TextInputType? inputType;
  final String? Function(String?)? validator;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: inputType,
      onChanged: onChanged,
      validator: validator,
      obscureText: obscureText,
      cursorColor: const Color.fromRGBO(94, 82, 82, 1),

      decoration: InputDecoration(
        label: Text(label),

        prefixIcon: iconPrefix,
        suffixIcon: iconsufix,

        labelStyle: const TextStyle(
          color: Color.fromARGB(255, 98, 90, 90),
          fontSize: 15,
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color.fromARGB(255, 98, 90, 90)),
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color.fromARGB(255, 98, 90, 90)),
        ),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color.fromARGB(255, 98, 90, 90)),
        ),
      ),
    );
  }
}
