import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/cart_bloc.dart';
import '../bloc/cart_event.dart';
import '../bloc/cart_state.dart';
import 'cart_checkout_section.dart';
import 'cart_item_card.dart';

class ListOfCartItem extends StatelessWidget {
  const ListOfCartItem({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: state.cartProducts.length,
                itemBuilder: (context, index) {
                  final cartItem = state.cartProducts[index];

                  return CartItemCard(
                    product: cartItem,
                    onIncrease: () {
                      context.read<CartBloc>().add(
                        IncreaseQuantityEvent(cartItem.product),
                      );
                    },
                    onDecrease: () {
                      context.read<CartBloc>().add(
                        DecreaseQuantityEvent(cartItem.product),
                      );
                    },
                    onRemove: () {
                      context.read<CartBloc>().add(
                        RemoveFromCartEvent(cartItem.product),
                      );
                    },
                  );
                },
              ),
            ),

            const CartCheckoutSection(),
          ],
        );
      },
    );
  }
}