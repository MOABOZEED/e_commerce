import 'package:ecommerce/features/cart/presentation/widget/product_imag.dart';
import 'package:ecommerce/features/cart/presentation/widget/product_title.dart';
import 'package:ecommerce/features/cart/presentation/widget/quantity_stepper.dart';
import 'package:ecommerce/features/cart/presentation/widget/remove_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/custom_dialog.dart';
import '../../../products/domain/entity/product_entity.dart';
import '../../domain/entity/cart_entity.dart';
import '../bloc/cart_bloc.dart';
import '../bloc/cart_event.dart';
import 'line_total.dart';

class CartItemContent extends StatelessWidget {
  final CartEntity cart;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;
  final VoidCallback onRemove;

  const CartItemContent({
    super.key,
    required this.cart,
    required this.onIncrease,
    required this.onDecrease,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProductImage(images: cart.product.image, size: 90.sp),

        const SizedBox(width: 14),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductTitle(title: cart.product.title),

              SizedBox(height: 8.h),

              LineTotal(product: cart.product),

              SizedBox(height: 14.h),

              QuantityStepper(
                quantity: cart.quantity,
                onIncrease: () {
                  context.read<CartBloc>().add(
                    IncreaseQuantityEvent(cart.product),
                  );
                },
                onDecrease: () {
                  context.read<CartBloc>().add(
                    DecreaseQuantityEvent(cart.product),
                  );
                },
              ),
            ],
          ),
        ),

        RemoveButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (_) => CustomDeleteDialog(
                title: "Remove ${cart.product.title}",
                cancelText: "Cancel",
                deleteText: "Delete",
                onDelete: () {
                  context.read<CartBloc>().add(
                    RemoveFromCartEvent(cart.product),
                  );
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
