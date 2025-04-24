import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class UserComment extends StatelessWidget {
  const UserComment({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 4,
      children: [
        Text('User Name', style: AppTextStyles.bold12),
        Text('User Comment', style: AppTextStyles.regular12),
      ],
    );
  }
}
