import 'package:ecommerce/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import '../../../cart/presentation/bloc/cart_bloc.dart';
import '../../../cart/presentation/bloc/cart_event.dart';
import '../../../cart/presentation/bloc/cart_state.dart';
import '../../domain/entity/product_entity.dart';
import '../pages/product_details_page.dart';
import 'button_add_to_cart.dart';

class BodyCard extends StatelessWidget {
  final ProductEntity product;

  const BodyCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ProductDetailsPage(product: product),
              ),
            );
          },
          child: Card(
            color: Colors.grey[200],
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      color: AppColors.greyColor,
                      child: Image.network(
                        product.image![0],
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(
                            Icons.image_not_supported,
                            size: 60,
                          );
                        },
                        loadingBuilder: (context, child, progress) {
                          if (progress == null) return child;

                          return Shimmer.fromColors(
                            baseColor: Colors.grey.shade300,
                            highlightColor: Colors.grey.shade100,
                            child: Container(color: Colors.white),
                          );
                        },
                      ),
                    ),
                  ),

                  Text(
                    product.title ?? '',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),

                  ButtonNavigationCart(
                    product: product,
                    text: "Add To Cart",
                    onPressed: () {
                      context.read<CartBloc>().add(AddToCartEvent(product!));

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('${product?.title} added to cart'),
                          duration: const Duration(seconds: 1),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
