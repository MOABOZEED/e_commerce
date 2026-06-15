import 'package:ecommerce/features/auth/presentation/widgets/custom_confirm_button.dart';

import 'package:ecommerce/core/widgets/custom_text_fild.dart';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../products/presentation/pages/product_page.dart';

import '../../domain/entities/register_params.dart';
import '../bloc/auth_bloc.dart';

import '../bloc/auth_event.dart';

import '../bloc/auth_state.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final nameController = TextEditingController();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final confirmPasswordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register')),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            /// REGISTER SUCCESS
            if (state is RegisterSuccess) {
              Navigator.push(
                context,

                MaterialPageRoute(
                  builder: (_) => BlocProvider.value(
                    value: context.read<AuthBloc>()..add(GetCurrentUserEvent()),

                    child: const ProductPage(),
                  ),
                ),
              );
         
            }

            /// ERROR
            if (state is AuthError) {
              showDialog(
                context: context,

                builder: (_) {
                  return AlertDialog(
                    title: const Icon(Icons.error, color: Colors.red, size: 40),

                    content: Text(state.message),
                  );
                },
              );
            }
          },

          builder: (context, state) {
            return Center(
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      /// TITLE
                      const Center(
                        child: Text(
                          'Create Account',

                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      const SizedBox(height: 40),

                      /// NAME
                      CustomTextField(
                        textAbove: "Full Name",

                        hintText: 'Enter Your Name',

                        controller: nameController,

                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Name is required';
                          }

                          // if (value.length < 3) {
                          //   return 'Name is too short';
                          // }

                          return null;
                        },
                      ),

                      const SizedBox(height: 20),

                      /// EMAIL
                      CustomTextField(
                        textAbove: "Email",

                        hintText: 'Enter Your Email',

                        controller: emailController,

                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Email is required';
                          }

                          // if (!value.contains('@')) {
                          //   return 'Enter valid email';
                          // }

                          return null;
                        },
                      ),

                      const SizedBox(height: 20),

                      /// PASSWORD
                      CustomTextField(
                        textAbove: "Password",

                        hintText: 'Enter Password',

                        controller: passwordController,

                        obscureText: true,

                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password is required';
                          }

                          // if (value.length < 6) {
                          //   return 'Password must be at least 6 characters';
                          // }

                          return null;
                        },
                      ),

                      const SizedBox(height: 20),

                      /// CONFIRM PASSWORD
                      CustomTextField(
                        textAbove: "Confirm Password",

                        hintText: 'Confirm Password',

                        controller: confirmPasswordController,

                        obscureText: true,

                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Confirm password is required';
                          }

                          if (value != passwordController.text) {
                            return 'Password does not match';
                          }

                          return null;
                        },
                      ),

                      const SizedBox(height: 35),

                      /// BUTTON
                      state is AuthLoading
                          ? const Center(child: CircularProgressIndicator())
                          : SizedBox(
                              width: double.infinity,

                              child: CustomConfirmButton(
                                text: 'Register',

                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    context.read<AuthBloc>().add(
                                      RegisterEvent(
                                        RegisterParams(
                                          name: nameController.text.trim(),

                                          email: emailController.text.trim(),

                                          password: passwordController.text
                                              .trim(),

                                          passwordConfirmation:
                                              confirmPasswordController.text
                                                  .trim(),
                                        ),
                                      ),
                                    );
                                  }
                                },
                              ),
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
