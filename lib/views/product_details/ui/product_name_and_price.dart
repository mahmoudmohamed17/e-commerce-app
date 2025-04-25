import 'package:e_commerce_app/core/helpers/app_colors.dart';
import 'package:e_commerce_app/core/models/product_model/product_model.dart';
import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class ProductNameAndPrice extends StatelessWidget {
  const ProductNameAndPrice({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(product.productName!, style: AppTextStyles.bold16),
        Text(
          r'$'
          '${product.productCurrentPrice!.toStringAsFixed(2)}',
          style: AppTextStyles.bold12.copyWith(color: AppColors.kPrimaryColor),
        ),
      ],
    );
  }
}
