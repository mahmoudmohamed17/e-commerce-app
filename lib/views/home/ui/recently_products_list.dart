import 'package:e_commerce_app/views/home/ui/product_item.dart';
import 'package:flutter/material.dart';

class RecentlyProductsList extends StatelessWidget {
  const RecentlyProductsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(7, (index) {
        return const Padding(
          padding: EdgeInsets.only(bottom: 12),
          child: ProductItem(),
        );
      }),
    );
  }
}
