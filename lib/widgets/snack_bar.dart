import 'package:flutter/material.dart';

SnackBar mySnackBar({
  required BuildContext context,
  required String contentMessage,
  required String actionLabel,
}) {
  return SnackBar(
    content: Text(contentMessage),
    action: SnackBarAction(label: actionLabel, onPressed: () {}),
    duration: Duration(seconds: 1),
  );
}
