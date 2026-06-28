import 'package:flutter/material.dart';

class CustomButtonCart extends StatelessWidget {
  final Widget icon;
  final void Function()? onPressed;
  final double? size;

  const CustomButtonCart({
    super.key,
    required this.icon,
    this.onPressed,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: onPressed, icon: icon);
  }
}
