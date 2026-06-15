import 'package:ecommerce/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:ecommerce/features/auth/presentation/bloc/auth_event.dart';
import 'package:ecommerce/features/auth/presentation/bloc/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'drawer_headr_widget.dart';
import 'drawer_item_widget.dart';



class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            const _DrawerHeader(),

            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  DrawerItemWidget(
                    icon: Icons.shopping_bag_outlined,
                    title: "Products",
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),

                  DrawerItemWidget(
                    icon: Icons.shopping_cart_outlined,
                    title: "Cart",
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),

            const Divider(),

            DrawerItemWidget(
              icon: Icons.logout,
              title: "Logout",
              onTap: () {
                context.read<AuthBloc>().add(
                  LogoutEvent(),
                );
              },
            ),

            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

class _DrawerHeader extends StatelessWidget {
  const _DrawerHeader();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<AuthBloc, AuthState, CurrentUserSuccess?>(
      selector: (state) {
        if (state is CurrentUserSuccess) {
          return state;
        }
        return null;
      },
      builder: (context, state) {
        return DrawerHeaderWidget(
          userName: state?.user.name ?? "Guest",
          userEmail: state?.user.email ?? "guest@email.com",
        );
      },
    );
  }
}