import 'package:e_shop/core/constants/app_colors.dart';
import 'package:e_shop/core/extensions/buildcontext/media_query_size.dart';
import 'package:flutter/material.dart';

class BodyText extends StatelessWidget {
  final String text;
  const BodyText({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.justify,
      style: TextStyle(
        fontSize: 0.0205 * context.mqSize.height,
        color: blackColor,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
