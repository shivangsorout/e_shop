import 'package:e_shop/features/auth/view/widgets/auth_text_field.dart';
import 'package:flutter/material.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({
    super.key,
    required TextEditingController passwordController,
  }) : _passwordController = passwordController;

  final TextEditingController _passwordController;

  @override
  Widget build(BuildContext context) {
    return AuthTextField(
      controller: _passwordController,
      hintText: 'Password',
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your password!';
        } else if (value.length <= 6) {
          return 'Password length should be more than 6 characters!';
        } else {
          return null;
        }
      },
    );
  }
}
