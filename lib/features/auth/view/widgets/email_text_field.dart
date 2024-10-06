import 'package:e_shop/features/auth/view/widgets/auth_text_field.dart';
import 'package:flutter/material.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField({
    super.key,
    required TextEditingController emailController,
    this.textInputAction = TextInputAction.next,
  }) : _emailController = emailController;

  final TextEditingController _emailController;
  final TextInputAction textInputAction;

  @override
  Widget build(BuildContext context) {
    return AuthTextField(
      controller: _emailController,
      hintText: 'Email',
      keyboardType: TextInputType.emailAddress,
      textInputAction: textInputAction,
      validator: (value) {
        // Regular expression for validating an email
        String pattern =
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&\'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
        RegExp regex = RegExp(pattern);
        if (value == null || value.isEmpty) {
          return 'Please enter your email!';
        } else if (!regex.hasMatch(value)) {
          return 'Enter a valid email address!';
        } else {
          return null;
        }
      },
    );
  }
}
