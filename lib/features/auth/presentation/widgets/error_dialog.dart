import 'package:flutter/material.dart';

Future<void> showCustomDialog(
    BuildContext context, {
      required String title,
      required String message,
      IconData icon = Icons.error_outline,
      Color iconColor = Colors.red,
      String buttonText = "OK",
      VoidCallback? onPressed,
    }) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),

        title: Row(
          children: [
            Icon(
              icon,
              color: iconColor,
              size: 28,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),

        content: Text(
          message,
          style: const TextStyle(
            fontSize: 15,
          ),
        ),

        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);

              if (onPressed != null) {
                onPressed();
              }
            },
            child: Text(buttonText),
          ),
        ],
      );
    },
  );
}