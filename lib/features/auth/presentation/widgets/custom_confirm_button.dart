import 'package:ecommerce/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../products/presentation/pages/product_page.dart';

class CustomConfirmButton extends StatelessWidget {
  const CustomConfirmButton({
    super.key,
    this.nameController,
    this.emailController,
    this.passwordController,
    this.onPressed,
    this.text,
  });

  final TextEditingController? nameController;
  final TextEditingController? emailController;
  final TextEditingController? passwordController;
  final Function()? onPressed;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(

        borderRadius: BorderRadius.circular(10),
        color: AppColors.primaryBlue,
      ),

      child: TextButton(
        style: ButtonStyle(),
        onPressed: onPressed,
        child: CustomText(text: "$text", size: 20,color: AppColors.white,),
      ),
    );
  }
}
