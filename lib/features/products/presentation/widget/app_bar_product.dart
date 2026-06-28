import 'package:flutter/material.dart';

import '../../../../core/widgets/cart_icon_badge.dart';
import '../../../../core/widgets/custom_text_w300.dart';

class AppBarProduct extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;

  const AppBarProduct({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: CustomTextW300(
        text: title,
      ),
      actions: const [
        CartBadgeIcon(),
      ],
    );
  }

  @override
  Size get preferredSize =>
      const Size.fromHeight(kToolbarHeight);
}