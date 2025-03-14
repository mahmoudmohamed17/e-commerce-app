import 'package:e_commerce_app/core/helpers/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:e_commerce_app/core/utils/custom_button.dart';
import 'package:flutter/material.dart';

class ProductPriceAndBuyButton extends StatelessWidget {
  const ProductPriceAndBuyButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 4,
          children: [
            const Text('230LE', style: AppTextStyles.bold12),
            Text(
              '280LE',
              style: AppTextStyles.bold10.copyWith(
                color: AppColors.kGreyColor,
                decoration: TextDecoration.lineThrough,
                decorationColor: AppColors.kGreyColor,
              ),
            ),
          ],
        ),
        CustomButton(label: 'Buy Item', onPressed: () {}),
      ],
    );
  }
}
