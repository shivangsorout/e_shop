import 'package:e_shop/core/extensions/buildcontext/media_query_size.dart';
import 'package:e_shop/features/auth/view/pages/forget_password_page.dart';
import 'package:e_shop/features/auth/view/pages/signup_page.dart';
import 'package:e_shop/features/auth/view/widgets/auth_button.dart';
import 'package:e_shop/features/auth/view/widgets/bold_text_button.dart';
import 'package:e_shop/features/auth/view/widgets/email_text_field.dart';
import 'package:e_shop/features/auth/view/widgets/header_text.dart';
import 'package:e_shop/features/auth/view/widgets/password_text_field.dart';
import 'package:e_shop/features/auth/view/widgets/richtext_button.dart';
import 'package:e_shop/features/home/view/pages/shop_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
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
                  EmailTextField(emailController: _emailController),
                  PasswordTextField(passwordController: _passwordController),
                  BoldTextButton(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ForgetPasswordPage(),
                        ),
                      );
                    },
                    text: 'Forgot your password?',
                  ),
                ],
              ),
              Column(
                children: [
                  AuthButton(
                    buttonText: 'Login',
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (context) => ShopPage(),
                          ),
                          (route) => false,
                        );
                      }
                    },
                  ),
                  SizedBox(height: 0.015 * context.mqSize.height),
                  RichTextButton(
                    firstText: 'New here?',
                    secondText: 'Signup',
                    onTap: () {
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => SignupPage(),
                        ),
                        (route) => false,
                      );
                    },
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
