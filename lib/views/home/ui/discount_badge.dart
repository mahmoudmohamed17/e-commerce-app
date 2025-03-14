import 'package:e_commerce_app/core/helpers/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class DiscountBadge extends StatelessWidget {
  const DiscountBadge({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.kPrimaryColor,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(8),
          bottomRight: Radius.circular(8),
        ),
      ),
      padding: const EdgeInsets.all(8),
      child: Text(
        '10% OFF',
        style: AppTextStyles.regular12.copyWith(color: Colors.white),
      ),
    );
  }
}
