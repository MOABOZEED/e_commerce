import 'package:flutter/material.dart';

class CustomTextW300 extends StatelessWidget {
  final String text;


  const CustomTextW300({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontWeight: FontWeight.w300, fontSize: 20),
    );
  }
}
