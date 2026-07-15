import 'package:ecommerce/core/constants/app_icon.dart';
import 'package:ecommerce/core/theme/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuantityStepper extends StatelessWidget {
  final int quantity;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;

  const QuantityStepper({
    super.key,
    required this.quantity,
    required this.onIncrease,
    required this.onDecrease,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 42,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color:AppColors.greyShade300),
      ),
      child: Row(
        children: [
          Expanded(
            child: IconButton(
              onPressed: onDecrease,
              icon: const Icon(AppIcons.remove),
            ),
          ),
          Text(
            quantity.toString(),
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: IconButton(
              onPressed: onIncrease,
              icon: const Icon(AppIcons.add),
            ),
          ),
        ],
      ),
    );
  }
}
