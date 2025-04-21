import 'package:e_commerce_app/core/helpers/assets.dart';
import 'package:e_commerce_app/core/utils/custom_text_search_field.dart';
import 'package:e_commerce_app/views/home/ui/popular_categories_widger.dart';
import 'package:e_commerce_app/views/home/ui/recently_products_widget.dart';
import 'package:flutter/material.dart';

class HomeViewWidget extends StatelessWidget {
  const HomeViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.00),
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(child: SizedBox(height: 16)),
            const SliverToBoxAdapter(child: CustomTextSearchField()),
            const SliverToBoxAdapter(child: SizedBox(height: 16)),
            SliverToBoxAdapter(child: Image.asset(Assets.imagesPoster)),
            const SliverToBoxAdapter(child: SizedBox(height: 16)),
            const SliverToBoxAdapter(child: PopularCategoriesWidger()),
            const SliverToBoxAdapter(child: SizedBox(height: 16)),
            const SliverToBoxAdapter(child: RecentlyProductsWidget()),
          ],
        ),
      ),
    );
  }
}
