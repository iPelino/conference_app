import 'package:flutter/material.dart';

import '../themes/colors.dart';

class LoginTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;
  final bool hasHiddenChars;

  const LoginTextField(
      {Key? key,
      required this.hintText,
      required this.controller,
      this.validator,
      this.hasHiddenChars = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        obscureText: hasHiddenChars,
        controller: controller,
        style: TextStyle(color: BrandColor.textColor),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: BrandColor.secondaryColorLight),
          border: OutlineInputBorder(),
        ),
        validator: validator);
  }
}
