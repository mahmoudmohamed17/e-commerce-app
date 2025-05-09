import 'package:e_commerce_app/core/helpers/app_colors.dart';
import 'package:e_commerce_app/core/helpers/navigation_extension.dart';
import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:e_commerce_app/views/home/logic/models/categort_item_model.dart';
import 'package:e_commerce_app/views/home/ui/category_view.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.model});
  final CategortItemModel model;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(
          CategoryView.id,
          arguments: model.title.toLowerCase(),
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 4,
        children: [
          Container(
            decoration: const BoxDecoration(
              color: AppColors.kPrimaryColor,
              shape: BoxShape.circle,
            ),
            height: 60,
            width: 60,
            child: Center(
              child: Icon(model.icon, color: Colors.white, size: 35),
            ),
          ),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(model.title, style: AppTextStyles.medium12),
          ),
        ],
      ),
    );
  }
}
