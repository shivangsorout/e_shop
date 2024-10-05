import 'package:e_shop/core/constants/app_colors.dart';
import 'package:e_shop/core/extensions/buildcontext/media_query_size.dart';
import 'package:flutter/material.dart';

class RichTextButton extends StatelessWidget {
  final void Function()? onTap;
  final String firstText;
  final String secondText;
  const RichTextButton({
    super.key,
    required this.onTap,
    required this.firstText,
    required this.secondText,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: RichText(
        text: TextSpan(
          style: TextStyle(
            fontSize: 0.017 * context.mqSize.height,
          ),
          children: [
            TextSpan(
              text: "$firstText ",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                color: blackColor,
              ),
            ),
            TextSpan(
              text: secondText,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
