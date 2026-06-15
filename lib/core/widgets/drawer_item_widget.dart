import 'package:flutter/material.dart';

import 'custom_text.dart';

class DrawerItemWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const DrawerItemWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: CustomText(
        text: title,
        size: 15,
      ),
      onTap: onTap,
    );
  }
}