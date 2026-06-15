import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/custom_text_w300.dart';
import '../../../../core/widgets/custom_text.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText(
          text: "Welcome Back !",
          size: 30,
        ),

        SizedBox(height: 25.h),

        CustomTextW300(
          text: "Login to your account",
        ),
      ],
    );
  }
}