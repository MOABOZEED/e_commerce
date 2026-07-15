import 'package:ecommerce/core/theme/app_colors.dart';
import 'package:ecommerce/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../bloc/cart_bloc.dart';
import '../bloc/cart_event.dart';
import '../bloc/cart_state.dart';
import '../widget/cart_item_card.dart';
import '../widget/list_Of_cart_item.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: CustomText(text: "My Cart", size: 20)),

      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.cartProducts.isEmpty) {
            return Center(
              child: CustomText(text: "Cart is Empty", size: 20.sp),
            );
          }

          return ListOfCartItem();
        },
      ),
    );
  }
}
