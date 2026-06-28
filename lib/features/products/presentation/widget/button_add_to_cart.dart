import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/custom_text.dart';
import '../../domain/entity/product_entity.dart';

class ButtonNavigationCart extends StatelessWidget {
  final String text;
  final void Function()? onPressed;

  const ButtonNavigationCart({super.key, this.product, required this.text, this.onPressed});

  final ProductEntity? product;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.primaryBlue,
      ),
      child: TextButton(
        onPressed:onPressed,
        child: SizedBox(
          width: double.infinity,
          child: CustomText(text: text, size: 15, color: AppColors.black),
        ),
      ),
    );
  }
}
