import 'package:ecommerce/features/admin/presentation/pages/admin_home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';
import '../../../products/presentation/pages/product_page.dart';
import '../../data/datasource/local/auth_local_data_source.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../bloc/auth_state.dart';
import '../pages/register_page.dart';
import '../widgets/login_button.dart';
import '../widgets/login_form.dart';
import '../widgets/login_header.dart';
import '../widgets/regester_text.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              if (state.auth.user.role == 'admin') {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => const AdminHomePage()),
                  (route) => false,
                );
              } else {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => const ProductPage()),
                  (route) => false,
                );
              }
            }

            if (state is AuthError) {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: const Icon(Icons.error, color: Colors.red, size: 40),
                  content: Text(state.message),
                ),
              );
            }
          },
          builder: (context, state) {
            return Center(
              child: Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const LoginHeader(),

                      const SizedBox(height: 30),

                      LoginForm(
                        emailController: emailController,
                        passwordController: passwordController,
                      ),

                      const SizedBox(height: 30),

                      LoginButton(
                        isLoading: state is AuthLoading,
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            context.read<AuthBloc>().add(
                              UserLoginEvent(
                                email: emailController.text.trim(),
                                password: passwordController.text.trim(),
                              ),
                            );
                          }
                        },
                      ),

                      ElevatedButton(
                        onPressed: () async {
                          final token = await sl<AuthLocalDataSource>()
                              .getToken();

                          print(token);
                        },
                        child: const Text('Check Token'),
                      ),

                      const SizedBox(height: 20),

                      RegisterText(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => BlocProvider.value(
                                value: context.read<AuthBloc>(),
                                child: RegisterScreen(),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
