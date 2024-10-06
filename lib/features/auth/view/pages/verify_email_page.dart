import 'package:e_shop/core/extensions/buildcontext/media_query_size.dart';
import 'package:e_shop/features/auth/view/pages/login_page.dart';
import 'package:e_shop/features/auth/view/widgets/auth_button.dart';
import 'package:e_shop/features/auth/view/widgets/body_text.dart';
import 'package:e_shop/features/auth/view/widgets/bold_text_button.dart';
import 'package:e_shop/features/auth/view/widgets/header_text.dart';
import 'package:e_shop/core/helpers/overlays/overlay_wrapper.dart';
import 'package:e_shop/features/auth/view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VerifyEmailPage extends StatefulWidget {
  const VerifyEmailPage({super.key});

  @override
  State<VerifyEmailPage> createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage> {
  @override
  Widget build(BuildContext context) {
    final authVM = Provider.of<AuthViewModel>(context);
    return OverlayWrapper(
      viewModel: context.read<AuthViewModel>(),
      child: Scaffold(
        body: SafeArea(
          minimum:
              EdgeInsets.symmetric(horizontal: 0.046 * context.mqSize.width),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              HeaderText(),
              BodyText(
                text:
                    "We've sent you an email verification. Please open it to verify your account. If you haven't received a verification mail yet, press the button below.",
              ),
              Column(
                children: [
                  AuthButton(
                    buttonText: 'Send verification link',
                    onPressed: () async {
                      await authVM.sendEmailVerification();
                    },
                  ),
                  SizedBox(height: 0.015 * context.mqSize.height),
                  BoldTextButton(
                    onTap: () async {
                      await authVM.logout();
                      if (context.mounted) {
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ),
                          (route) => false,
                        );
                      }
                    },
                    text: 'Restart',
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
