import 'package:e_commerce_app/core/helpers/app_colors.dart';
import 'package:e_commerce_app/core/managers/products_cubit/products_cubit.dart';
import 'package:e_commerce_app/core/models/product_model/product_model.dart';
import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProductNameAndHeartButton extends StatelessWidget {
  const ProductNameAndHeartButton({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        var cubit = context.read<ProductsCubit>();
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text(product.productName!, style: AppTextStyles.bold12),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: IconButton(
                onPressed: () {
                  cubit.checkIsFavorite(product.productId!)
                      ? cubit.removeProductFromFavorites(product)
                      : cubit.addProductToFavorites(product);
                },
                icon: Icon(
                  FontAwesomeIcons.solidHeart,
                  color:
                      cubit.checkIsFavorite(product.productId!)
                          ? AppColors.kPrimaryColor
                          : AppColors.kGreyColor,
                  size: 20,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
