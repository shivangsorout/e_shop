import 'package:e_shop/core/constants/app_colors.dart';
import 'package:e_shop/core/extensions/buildcontext/media_query_size.dart';
import 'package:flutter/material.dart';

class BoldTextButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  const BoldTextButton({
    super.key,
    required this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 0.017 * context.mqSize.height,
            fontWeight: FontWeight.w700,
            color: primaryColor,
          ),
        ),
      ),
    );
  }
}
