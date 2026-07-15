import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/custom_text.dart';
import '../bloc/cart_bloc.dart';
import '../bloc/cart_state.dart';
import 'chek_out_button.dart';

class CartCheckoutSection extends StatelessWidget {
  const CartCheckoutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [BoxShadow(blurRadius: 10, color:AppColors.black)],
      ),
      child: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) => Column(
          children: [
            Row(
              children: [
                CustomText(text: "Items", size: 18.sp),

                const Spacer(),

                CustomText(text: "${state.cartProducts.length}", size: 18.sp),
              ],
            ),

            SizedBox(height: 8.h),

            Row(
              children: [
                CustomText(text: "Delivery", size: 18.sp),

                Spacer(),

                CustomText(text: "Free", size: 18.sp, color: AppColors.red),
              ],
            ),

            Divider(height: 20.h),

            Row(
              children: [
                CustomText(
                  text: "Total Price",
                  size: 18.sp,
                  weight: FontWeight.bold,
                ),

                Spacer(),

                CustomText(
                  text:
                      "\$${state.cartProducts.fold<double>(0, (sum, item) => sum + ((item.product.price ?? 0) * (item.quantity))).toStringAsFixed(2)}",
                  size: 18.sp,
                  color: AppColors.green,
                  weight: FontWeight.bold,
                ),
              ],
            ),

            SizedBox(height: 10.h),

            CheckOutButton(),
          ],
        ),
      ),
    );
  }
}
