import 'package:e_shop/core/extensions/buildcontext/media_query_size.dart';
import 'package:e_shop/features/auth/view/pages/login_page.dart';
import 'package:e_shop/features/auth/view/widgets/auth_button.dart';
import 'package:e_shop/features/auth/view/widgets/body_text.dart';
import 'package:e_shop/features/auth/view/widgets/bold_text_button.dart';
import 'package:e_shop/features/auth/view/widgets/email_text_field.dart';
import 'package:e_shop/features/auth/view/widgets/header_text.dart';
import 'package:flutter/material.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _emailController;

  @override
  void initState() {
    _emailController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SafeArea(
          minimum:
              EdgeInsets.symmetric(horizontal: 0.046 * context.mqSize.width),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              HeaderText(),
              Column(
                children: [
                  BodyText(
                    text:
                        'If you forgot your password, simply enter your email and we will send you a password reset link.',
                  ),
                  SizedBox(height: 0.0285 * context.mqSize.height),
                  EmailTextField(emailController: _emailController),
                ],
              ),
              Column(
                children: [
                  AuthButton(
                    buttonText: 'Send reset link',
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {}
                    },
                  ),
                  SizedBox(height: 0.015 * context.mqSize.height),
                  BoldTextButton(
                    onTap: () {
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ),
                        (route) => false,
                      );
                    },
                    text: 'Back to login page',
                  ),
                  SizedBox(
                    height: 0.057 * context.mqSize.height,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
