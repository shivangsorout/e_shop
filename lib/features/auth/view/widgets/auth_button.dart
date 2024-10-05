import 'package:e_shop/core/constants/app_colors.dart';
import 'package:e_shop/core/extensions/buildcontext/media_query_size.dart';
import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final String buttonText;
  final void Function()? onPressed;

  const AuthButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 0.15 * context.mqSize.width,
            ),
            child: MaterialButton(
              onPressed: onPressed,
              color: primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 0.016 * context.mqSize.height,
                ),
                child: Text(
                  buttonText,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: whiteColor,
                    fontSize: 0.025 * context.mqSize.height,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
