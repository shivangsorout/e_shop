import 'package:e_shop/core/constants/app_colors.dart';
import 'package:e_shop/core/extensions/buildcontext/media_query_size.dart';
import 'package:flutter/material.dart';

class HeaderText extends StatelessWidget {
  const HeaderText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 0.023 * context.mqSize.height,
        ),
        Text(
          'e-Shop',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: primaryColor,
            fontSize: 0.027 * context.mqSize.height,
          ),
        ),
      ],
    );
  }
}
