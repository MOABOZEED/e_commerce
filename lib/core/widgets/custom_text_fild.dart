import 'package:ecommerce/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;

  final String? hintText;
  final String? textAbove;

  final IconData? icon;

  final bool obscureText;
  final String? Function(String?)? validator;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.icon,
    this.obscureText = false,
    this.validator,
    this.textAbove,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(left: 16, bottom: 4, top: 15),
          child: CustomText(
            text: textAbove ?? "",
            size: 15,
            weight: FontWeight.bold,
          ),
        ),
        TextFormField(
          controller: controller,

          obscureText: obscureText,

          validator: validator,
          textAlign: TextAlign.start,

          decoration: InputDecoration(
            // prefixIcon: Icon(icon),
            hintText: hintText ?? "",

            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
      ],
    );
  }
}
