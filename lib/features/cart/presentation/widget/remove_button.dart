import 'package:flutter/material.dart';

import '../../../../core/constants/app_icon.dart';
import '../../../../core/theme/app_colors.dart';

class RemoveButton extends StatelessWidget {
  final VoidCallback onPressed;

  const RemoveButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: "Remove",
      splashRadius: 22,
      onPressed: onPressed,
      icon:  Icon(AppIcons.delete, color: AppColors.red),
    );
  }
}