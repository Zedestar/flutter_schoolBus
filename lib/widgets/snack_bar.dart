import 'package:flutter/material.dart';

ScaffoldFeatureController mySnackBar({
  required BuildContext context,
  required String contentMessage,
  required String actionLabel,
}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text("This is a SnackBar message"),
      action: SnackBarAction(
        label: "Undo",
        onPressed: () {
          // Handle the action
        },
      ),
      duration: Duration(seconds: 2),
    ),
  );
}
