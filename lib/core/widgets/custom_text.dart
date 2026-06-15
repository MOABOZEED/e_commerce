import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double size;
  final FontWeight? weight;
  final Color? color;

  const CustomText({
    super.key,
    required this.text,
    required this.size,
    this.weight,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,

      style: TextStyle(
        fontSize: size.sp,
        fontWeight: weight,
        color: color,
      ),
    );
  }
}