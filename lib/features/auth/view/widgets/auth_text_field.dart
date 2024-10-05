import 'package:e_shop/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

typedef ValidatorCallback = String? Function(String?);

class AuthTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType keyboardType;
  final ValidatorCallback validator;
  final TextInputAction? textInputAction;
  final bool obscureText;
  const AuthTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.keyboardType = TextInputType.name,
    this.textInputAction,
    required this.validator,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 20,
      ),
      child: TextFormField(
        obscureText: obscureText,
        textInputAction: textInputAction,
        controller: controller,
        keyboardType: keyboardType,
        validator: validator,
        decoration: InputDecoration(
          fillColor: whiteColor,
          filled: true,
          isDense: true,
          hintText: hintText,
          hintStyle: TextStyle(
            color: blackColor,
            fontWeight: FontWeight.w400,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
