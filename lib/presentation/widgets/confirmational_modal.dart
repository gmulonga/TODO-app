import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/quickalert.dart';
import 'package:todo/core/constants.dart';

void confirmationModal({
  required BuildContext context,
  required VoidCallback onConfirm,
  required String title,
  required String message,
  required String confirmButtonLabel,
  required QuickAlertType type,
}) {
  QuickAlert.show(
    context: context,
    type: type,
    title: title,
    text: message,
    confirmBtnText: confirmButtonLabel,
    cancelBtnText: "Cancel",
    confirmBtnColor: kGreen,
    onCancelBtnTap: () {
      Navigator.of(context).pop();
    },
    onConfirmBtnTap: () {
      if (context.mounted) {
        Navigator.of(context, rootNavigator: true).pop();
      }
      onConfirm();
    },
  );
}
