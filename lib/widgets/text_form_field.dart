import 'package:flutter/material.dart';

class TheTextFormInput extends StatelessWidget {
  const TheTextFormInput({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.controller,
    required this.textVisibility,
    required this.inputIcon,
    required this.keyboardType,
    this.validator,
  });

  final String labelText;
  final String hintText;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final IconData inputIcon;
  final bool textVisibility;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,

      // textInputAction: TextInputAction.next,
      obscureText: textVisibility,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        suffixIcon: Icon(
          inputIcon,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: Colors.grey, width: 1.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: Colors.blue, width: 2.0),
        ),
      ),
      style: TextStyle(fontSize: 16.0, color: Colors.black),
      cursorColor: Colors.blue,
      validator: validator,
      controller: controller,
    );
  }
}
