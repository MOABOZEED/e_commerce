import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_text.dart';

class RegisterText extends StatelessWidget {
  final VoidCallback onTap;

  const RegisterText({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CustomText(
        text: "Don't have an account? Register",
        size: 18,
      ),
    );
  }
}