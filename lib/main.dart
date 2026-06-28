import 'package:ecommerce/features/auth/presentation/pages/login_page.dart';
import 'package:ecommerce/features/products/presentation/controller/product_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'features/cart/presentation/bloc/cart_bloc.dart';
import 'features/orders/presentation/bloc/order_bloc.dart';
import 'features/products/presentation/controller/product_bloc.dart';
import 'injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),

      minTextAdapt: true,

      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => sl<AuthBloc>()),
            BlocProvider(
              create: (_) => sl<ProductBloc>()..add(GetProductsEvent()),
            ),

            BlocProvider(
              create: (_) => sl<ProductBloc>()..add(GetProductsEvent()),
            ),

            BlocProvider(create: (_) => sl<CartBloc>()),
            BlocProvider(create: (_) => OrdersBloc()),
          ],

          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: LoginScreen(),
          ),
        );
      },
    );
  }
}
