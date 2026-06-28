import 'package:ecommerce/core/widgets/custom_text.dart';
import 'package:ecommerce/features/cart/presentation/page/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widgets/custom_text_w300.dart';
import '../../../cart/presentation/bloc/cart_bloc.dart';
import '../../../cart/presentation/bloc/cart_event.dart';
import '../../domain/entity/product_entity.dart';
import '../controller/product_bloc.dart';
import '../controller/product_state.dart';
import '../widget/body_product_details.dart';
import '../widget/button_add_to_cart.dart';

class ProductDetailsPage extends StatelessWidget {
  final ProductEntity product;

  const ProductDetailsPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: CustomText(text: "Product Details", size: 25)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state.error != null) {
              return Center(child: CustomTextW300(text: state.error!));
            }

            return BodyProductDetails(product: product);
          },
        ),
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: ButtonNavigationCart(
          text: "Add To Cart ",
          product: product,
          onPressed: () {
            context.read<CartBloc>().add(AddToCartEvent(product));

            Navigator.push(
              context,
              MaterialPageRoute(builder: (builder) => CartPage()),
            );

            // Navigator.pushReplacement(
            //   context,
            //   MaterialPageRoute(builder: (context) => const CartPage()),
            // );

            // Navigator.pushReplacementNamed(context, '/cartPage');

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('${product.title} added to cart'),
                duration: const Duration(seconds: 1),
              ),
            );
          },
        ),
      ),
    );
  }
}
