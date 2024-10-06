import 'package:e_shop/core/extensions/buildcontext/media_query_size.dart';
import 'package:e_shop/core/helpers/overlays/dialogs/password_reset_email_sent_dialog.dart';
import 'package:e_shop/features/auth/view/pages/login_page.dart';
import 'package:e_shop/features/auth/view/widgets/auth_button.dart';
import 'package:e_shop/features/auth/view/widgets/body_text.dart';
import 'package:e_shop/features/auth/view/widgets/bold_text_button.dart';
import 'package:e_shop/features/auth/view/widgets/email_text_field.dart';
import 'package:e_shop/features/auth/view/widgets/header_text.dart';
import 'package:e_shop/core/helpers/overlays/overlay_wrapper.dart';
import 'package:e_shop/features/auth/view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
                    BodyText(
                      text:
                          'If you forgot your password, simply enter your email and we will send you a password reset link.',
                    ),
                    SizedBox(height: 0.0285 * context.mqSize.height),
                    EmailTextField(
                      emailController: _emailController,
                      textInputAction: TextInputAction.done,
                    ),
                  ],
                ),
                Column(
                  children: [
                    AuthButton(
                      buttonText: 'Send reset link',
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          await authVM.sendPasswordReset(
                            toEmail: _emailController.text,
                          );
                          if ((authVM.errorMessage == null ||
                                  authVM.errorMessage!.isEmpty) &&
                              context.mounted) {
                            showPasswordResetSentDialog(context);
                          }
                        }
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
      ),
    );
  }
}
