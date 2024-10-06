import 'package:e_shop/core/helpers/overlays/dialogs/generic_dialog.dart';
import 'package:flutter/material.dart';

Future<void> showPasswordResetSentDialog(BuildContext context) {
  return showGenericDialog<void>(
    context: context,
    title: 'Password Reset',
    content:
        'Password reset link has been sent to your email. Please check your email!',
    optionBuilder: () => {
      'OK': null,
    },
  );
}
