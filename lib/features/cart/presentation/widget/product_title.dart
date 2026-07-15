import 'package:flutter/material.dart';

class ProductTitle extends StatelessWidget {
  final String? title;

  const ProductTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title ?? "",
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: Theme.of(
        context,
      ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
    );
  }
}