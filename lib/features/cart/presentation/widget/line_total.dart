import 'package:flutter/material.dart';

import '../../../products/domain/entity/product_entity.dart';

class LineTotal extends StatelessWidget {
  final ProductEntity product;

  const LineTotal({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final total = (product.price ?? 0) * product.quantity;

    return Text(
      "\$${total.toStringAsFixed(2)}",
      style: Theme.of(context).textTheme.titleMedium?.copyWith(
        color: Colors.green.shade700,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}