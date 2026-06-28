import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../controller/product_bloc.dart';
import '../controller/product_state.dart';
import 'body_card.dart';
class ProductCard extends StatelessWidget {
  const ProductCard({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        return GridView.builder(
          // padding: const EdgeInsets.all(5),
          itemCount: state.allProducts.length,
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 220,
            childAspectRatio: 0.70,
            crossAxisSpacing: 5,
            mainAxisSpacing: 12,
          ),
          // gridDelegate:
          // const SliverGridDelegateWithFixedCrossAxisCount(
          //   crossAxisCount: 3,
          //   childAspectRatio: 0.55,
          //   crossAxisSpacing: 10,
          //   mainAxisSpacing: 15,
          // ),
          itemBuilder: (context, index) {
            return BodyCard(product: state.allProducts[index]);
          },
        );
      },
    );
  }
}
