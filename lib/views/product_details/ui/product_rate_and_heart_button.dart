import 'package:e_commerce_app/core/helpers/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProductRateAndHeartButton extends StatelessWidget {
  const ProductRateAndHeartButton({super.key, required this.productAvgRate});
  final double productAvgRate;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 4,
            children: [
              Text(productAvgRate.toStringAsFixed(2)),
              const Icon(
                FontAwesomeIcons.solidStar,
                color: Colors.amber,
                size: 20,
              ),
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
