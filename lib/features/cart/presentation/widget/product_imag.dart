import 'package:ecommerce/core/constants/app_icon.dart';
import 'package:ecommerce/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductImage extends StatelessWidget {
  final List<String>? images;
  final double size;
  // void Function()? onTap;

 const ProductImage({super.key, required this.images, this.size = 100});

  @override
  Widget build(BuildContext context) {
    final imageUrl = (images != null && images!.isNotEmpty)
        ? images!.first
        : null;

    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: size,
        height: size,
        color: AppColors.greyShade100,
        child: imageUrl == null
            ?  Icon(AppIcons.noImage, size: 40.sp)
            : Image.network(
          imageUrl,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, progress) {
            if (progress == null) return child;

            return const Center(
              child: CircularProgressIndicator(strokeWidth: 2),
            );
          },
          errorBuilder: (_, __, ___) {
            return  Icon(AppIcons.image, size: 40.sp);
          },
        ),
      ),
    );
  }
}