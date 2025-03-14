import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:e_commerce_app/core/utils/custom_text_search_field.dart';
import 'package:e_commerce_app/views/home/ui/recently_products_list.dart';
import 'package:flutter/material.dart';

class StoreViewWidget extends StatelessWidget {
  const StoreViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: SizedBox(height: 16)),
            SliverToBoxAdapter(
              child: Text(
                'Welcome to our Market',
                style: AppTextStyles.bold16,
                textAlign: TextAlign.center,
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 16)),
            SliverToBoxAdapter(child: CustomTextSearchField()),
            SliverToBoxAdapter(child: SizedBox(height: 16)),
            SliverToBoxAdapter(child: RecentlyProductsList()),
          ],
        ),
      ),
    );
  }
}
