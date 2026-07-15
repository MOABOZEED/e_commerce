import 'package:ecommerce/features/products/domain/entity/product_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../products/presentation/pages/product_details_page.dart';
import '../../domain/entity/cart_entity.dart';
import 'cart_item_content.dart';

class CartItemCard extends StatelessWidget {
  final CartEntity product;

  final VoidCallback onIncrease;
  final VoidCallback onDecrease;
  final VoidCallback onRemove;

  const CartItemCard({
    super.key,
    required this.product,
    required this.onIncrease,
    required this.onDecrease,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ProductDetailsPage(product: product.product),
          ),
        );
      },
      child: Card(
        elevation: 1,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        child: Padding(
          padding: EdgeInsets.all(14.w),
          child: CartItemContent(
            cart: product,
            onIncrease: onIncrease,
            onDecrease: onDecrease,
            onRemove: onRemove,
          ),
        ),
      ),
    );
  }
}
