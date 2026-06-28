import 'package:ecommerce/features/products/presentation/controller/product_bloc.dart';
import 'package:ecommerce/features/products/presentation/controller/product_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/custom_text.dart';
import '../../../../core/widgets/image_shimmer.dart';
import '../../../../core/widgets/custom_text_w300.dart';
import '../../../cart/presentation/bloc/cart_bloc.dart';
import '../../../cart/presentation/bloc/cart_state.dart';
import '../../domain/entity/product_entity.dart';
import 'button_add_to_cart.dart';
import 'counter_button_product_details.dart';

class BodyProductDetails extends StatelessWidget {
  const BodyProductDetails({super.key, required this.product});

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                product.image![0],
                height: 280.h,
                width: double.infinity,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  }

                  return const ImageShimmer();
                },
                errorBuilder: (context, error, stackTrace) {
                  return   ImageShimmer();

                    // Container(
                    // height: 280.h,
                    // width: double.infinity,
                    // color: Colors.grey.shade200,
                    // child: const Icon(Icons.image_not_supported, size: 70),
                  // );
                },
              ),
            ),
          ),

          SizedBox(height: 20.h),

          CustomText(
            text: product.title ?? '',
            size: 24,
            weight: FontWeight.bold,
          ),

          SizedBox(height: 10.h),

          CustomText(
            text: "\$${product.price}",
            size: 26,
            weight: FontWeight.bold,
            color: Colors.green,
          ),

          SizedBox(height: 20.h),

          Container(
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(12),
            ),
            child: CustomText(text: product.description ?? '', size: 15),
          ),

          SizedBox(height: 20.h),

          Chip(label: CustomText(text: product.category ?? '', size: 10)),

          CustomTextW300(text: "Quantity"),

          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              return CounterButtonProductDetails(product: product);
            },
          ),

          // Stack(
          //   children: [
          //     Align(
          //         alignment: AlignmentGeometry.bottomCenter,
          //         child: ButtonAddToCart(product: product)),
          //   ],
          //
          // ),
        ],
      ),
    );
  }
}
