import 'package:e_commerce_app/core/helpers/build_app_bar.dart';
import 'package:e_commerce_app/core/helpers/routes.dart';
import 'package:e_commerce_app/views/home/ui/recently_products_list.dart';
import 'package:flutter/material.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key, required this.category});
  static const String id = Routes.categoryView;
  final String category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, category),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(right: 12.0, left: 12.0, top: 12.0),
          child: RecentlyProductsList(category: category),
        ),
      ),
    );
  }
}
