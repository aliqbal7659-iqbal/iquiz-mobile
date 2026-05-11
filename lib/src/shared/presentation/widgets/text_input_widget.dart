import 'package:flutter/material.dart';

class TextInputWidget extends StatelessWidget {
  final TextEditingController? controller;
  final String? hint;
  final bool obscureText;

  final String? Function(String? value)? validator;
  const TextInputWidget({
    super.key,
    this.controller,
    this.hint,
    this.validator,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(hintText: hint),
      validator: validator,
    );
  }
}
