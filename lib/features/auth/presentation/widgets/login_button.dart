import 'package:flutter/material.dart';

import 'custom_confirm_button.dart';

class LoginButton extends StatelessWidget {
  final bool isLoading;
  final VoidCallback onPressed;

  const LoginButton({
    super.key,
    required this.isLoading,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return SizedBox(
      width: double.infinity,
      height: 50,
      child: CustomConfirmButton(
        text: "Login",
        onPressed: onPressed,
      ),
    );
  }
}