import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/custom_text.dart';
import '../../../cart/presentation/bloc/cart_bloc.dart';
import '../../../cart/presentation/bloc/cart_event.dart';
import '../../../cart/presentation/bloc/cart_state.dart';
import '../../domain/entity/product_entity.dart';
import 'counter_button.dart';

class CounterButtonProductDetails extends StatelessWidget {
  const CounterButtonProductDetails({super.key, required this.product});

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        final index = state.products.indexWhere(
          (item) => item.id == product.id,
        );

        final quantity = index != -1 ? state.products[index].quantity : 1;

        return Container(
          width: MediaQuery.sizeOf(context).width / 3,
          margin: const EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(border: Border.all()),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CounterButton(
                icon: Icons.remove_circle_outline,
                onPressed: () {
                  context.read<CartBloc>().add(DecreaseQuantityEvent(product));
                },
              ),

              CustomText(text: "$quantity", size: 25, weight: FontWeight.bold),

              CounterButton(
                icon: Icons.add_circle_outline,
                onPressed: () {
                  context.read<CartBloc>().add(IncreaseQuantityEvent(product));
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
