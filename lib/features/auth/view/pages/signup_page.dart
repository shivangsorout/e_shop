import 'package:e_shop/core/extensions/buildcontext/media_query_size.dart';
import 'package:e_shop/features/auth/view/pages/login_page.dart';
import 'package:e_shop/features/auth/view/pages/verify_email_page.dart';
import 'package:e_shop/features/auth/view/widgets/auth_button.dart';
import 'package:e_shop/features/auth/view/widgets/auth_text_field.dart';
import 'package:e_shop/features/auth/view/widgets/email_text_field.dart';
import 'package:e_shop/features/auth/view/widgets/header_text.dart';
import 'package:e_shop/core/helpers/overlays/overlay_wrapper.dart';
import 'package:e_shop/features/auth/view/widgets/password_text_field.dart';
import 'package:e_shop/features/auth/view/widgets/richtext_button.dart';
import 'package:e_shop/features/auth/view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final authVM = Provider.of<AuthViewModel>(context);
    return OverlayWrapper(
      viewModel: context.read<AuthViewModel>(),
      child: Scaffold(
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
                    AuthTextField(
                      controller: _nameController,
                      hintText: 'Name',
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name!';
                        } else {
                          return null;
                        }
                      },
                    ),
                    EmailTextField(emailController: _emailController),
                    PasswordTextField(passwordController: _passwordController),
                  ],
                ),
                Column(
                  children: [
                    AuthButton(
                      buttonText: 'Signup',
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          await authVM.signup(
                            name: _nameController.text,
                            email: _emailController.text,
                            password: _passwordController.text,
                          );
                          if (context.mounted) {
                            Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                builder: (context) => VerifyEmailPage(),
                              ),
                              (route) => false,
                            );
                          }
                        }
                      },
                    ),
                    SizedBox(height: 0.015 * context.mqSize.height),
                    RichTextButton(
                      firstText: 'Already have an account?',
                      secondText: 'Login',
                      onTap: () {
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
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
      ),
    );
  }
}
