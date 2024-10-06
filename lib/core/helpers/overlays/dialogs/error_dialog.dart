import 'package:e_shop/core/helpers/overlays/dialogs/generic_dialog.dart';
import 'package:flutter/material.dart';

Future<void> showErrorDialog(
  BuildContext context,
  String content,
) {
  return showGenericDialog<void>(
    context: context,
    title: 'An error occured',
    content: content,
    optionBuilder: () => {'Ok': null},
  );
}
