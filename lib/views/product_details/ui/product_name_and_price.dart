import 'package:e_commerce_app/core/helpers/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class ProductNameAndPrice extends StatelessWidget {
  const ProductNameAndPrice({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Product Name Here', style: AppTextStyles.bold16),
        Text(
          '130 LE',
          style: AppTextStyles.bold12.copyWith(color: AppColors.kPrimaryColor),
        ),
      ],
    );
  }
}
