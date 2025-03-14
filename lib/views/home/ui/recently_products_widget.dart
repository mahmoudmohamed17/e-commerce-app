import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:e_commerce_app/views/home/ui/recently_products_list.dart';
import 'package:flutter/material.dart';

class RecentlyProductsWidget extends StatelessWidget {
  const RecentlyProductsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      spacing: 8,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Recently Products', style: AppTextStyles.regular20),
        RecentlyProductsList(),
      ],
    );
  }
}
