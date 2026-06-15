import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_text_fild.dart';

class LoginForm extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const LoginForm({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          controller: emailController,
          hintText: "Enter Your Email",
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Email is required";
            }
            return null;
          },
        ),

        const SizedBox(height: 20),

        CustomTextField(
          controller: passwordController,
          textAbove: "Password",
          hintText: "Enter Password",
          obscureText: true,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Password is required";
            }
            return null;
          },
        ),
      ],
    );
  }
}
