import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:e_commerce_app/views/home/ui/product_item.dart';
import 'package:flutter/material.dart';

class RecentlyProductsWidget extends StatelessWidget {
  const RecentlyProductsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Recently Products', style: AppTextStyles.regular20),
        Column(
          children: List.generate(7, (index) {
            return const Padding(
              padding: EdgeInsets.only(bottom: 12),
              child: ProductItem(),
            );
          }),
        ),
      ],
    );
  }
}
