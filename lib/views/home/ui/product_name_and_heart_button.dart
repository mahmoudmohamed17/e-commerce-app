import 'package:e_commerce_app/core/helpers/app_colors.dart';
import 'package:e_commerce_app/core/models/product_model/product_model.dart';
import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProductNameAndHeartButton extends StatelessWidget {
  const ProductNameAndHeartButton({super.key,  required this.product});
final ProductModel product;


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 16),
          child: Text('Product Name', style: AppTextStyles.bold12),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              FontAwesomeIcons.solidHeart,
              color: AppColors.kGreyColor,
              size: 20,
            ),
          ),
        ),
      ],
    );
  }
}
