import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:e_commerce_app/views/home/logic/categort_item_model.dart';
import 'package:e_commerce_app/views/home/ui/category_item.dart';
import 'package:flutter/material.dart';

class PopularCategoriesWidger extends StatelessWidget {
  const PopularCategoriesWidger({super.key});

  static final List<CategortItemModel> _categories =  [
    CategortItemModel(title: 'Sport', icon: Icons.sports),
    CategortItemModel(title: 'Electronics', icon: Icons.tv),
    CategortItemModel(title: 'Collections', icon: Icons.collections),
    CategortItemModel(title: 'Books', icon: Icons.book),
    CategortItemModel(title: 'Games', icon: Icons.games),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 12,
      children: [
        const Text('Popular Categories', style: AppTextStyles.regular20),
        SizedBox(
          height: 85,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _categories.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(right: index == _categories.length - 1 ? 0 : 16),
                child:  CategoryItem(model: _categories[index],),
              );
            },
          ),
        ),
      ],
    );
  }
}
