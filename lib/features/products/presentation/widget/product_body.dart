import 'package:ecommerce/core/theme/app_colors.dart';
import 'package:ecommerce/core/widgets/custom_text.dart';
import 'package:ecommerce/features/products/presentation/widget/shimmer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/custom_text_w300.dart';
import '../controller/product_bloc.dart';
import '../controller/product_event.dart';
import '../controller/product_state.dart';
import 'grid_view_product_card.dart';

class ProductBody extends StatelessWidget {
  const   ProductBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state.error != null) {
          return Center(child: CustomTextW300(text: state.error!));
        }

        return Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              /// Search
              TextField(
                decoration: const InputDecoration(
                  hintText: 'Search Product',
                  suffixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  context.read<ProductBloc>().add(SearchProductsEvent(value));
                },
              ),

              SizedBox(height: 20.h),

              /// Category
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: CustomText(
                  size: 13,
                  text: 'All Category',
                  // style: TextStyle(
                  //   color: AppColors.black,
                  //   fontWeight: FontWeight.w500,
                  // ),
                ),
              ),

              SizedBox(height: 15.h),

              /// Products
              Expanded(
                child: state.isLoading
                    ? GridView.builder(
                        itemCount: 8,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: .68,
                              crossAxisSpacing: 12,
                              mainAxisSpacing: 12,
                            ),
                        itemBuilder: (_, __) => const ProductShimmer(),
                      )
                    : const ProductCard(),
              ),
            ],
          ),
        );
      },
    );
  }
}
