import 'package:e_commerce_app/core/helpers/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProductRateAndHeartButton extends StatelessWidget {
  const ProductRateAndHeartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 8),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 4,
            children: [
              Text('3', style: AppTextStyles.bold16),
              Icon(FontAwesomeIcons.solidStar, color: Colors.amber, size: 20),
            ],
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            FontAwesomeIcons.solidHeart,
            color: AppColors.kGreyColor,
            size: 20,
          ),
        ),
      ],
    );
  }
}
