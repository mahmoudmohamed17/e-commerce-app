import 'package:e_commerce_app/core/helpers/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:e_commerce_app/views/home/logic/categort_item_model.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.model});
  final CategortItemModel model;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 4,
      children: [
        CircleAvatar(
          backgroundColor: AppColors.kPrimaryColor,
          radius: 30,
          child: Icon(model.icon, color: Colors.white, size: 32,),
        ),
        Text(model.title, style: AppTextStyles.medium12),
      ],
    );
  }
}
