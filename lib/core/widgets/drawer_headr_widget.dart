import 'package:flutter/material.dart';

import 'custom_text.dart';

class DrawerHeaderWidget extends StatelessWidget {
  final String userName;
  final String userEmail;

  const DrawerHeaderWidget({
    super.key,
    required this.userName,
    required this.userEmail,
  });

  @override
  Widget build(BuildContext context) {
    return UserAccountsDrawerHeader(
      currentAccountPicture: const CircleAvatar(
        child: Icon(Icons.person),
      ),
      accountName: CustomText(
        text: userName,
        size: 15,
      ),
      accountEmail: CustomText(
        text: userEmail,
        size: 15,
      ),
    );
  }
}