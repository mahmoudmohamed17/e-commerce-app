import 'package:e_commerce_app/core/helpers/navigation_extension.dart';
import 'package:e_commerce_app/core/models/product_model/product_model.dart';
import 'package:e_commerce_app/core/widgets/custom_product_image.dart';
import 'package:e_commerce_app/views/home/ui/discount_badge.dart';
import 'package:e_commerce_app/views/home/ui/product_name_and_heart_button.dart';
import 'package:e_commerce_app/views/home/ui/product_price_and_buy_button.dart';
import 'package:e_commerce_app/views/product_details/ui/product_details_view.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        GestureDetector(
          onTap: () {
            context.pushNamed(ProductDetailsView.id, arguments: product);
          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            margin: EdgeInsets.zero,
            color: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                    bottomLeft: Radius.circular(16),
                  ),
                  child: CustomProductImage(imageUrl: product.productImage!),
                ),
                ProductNameAndHeartButton(product: product),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ProductPriceAndBuyButton(product: product),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          child: DiscountBadge(discount: product.productSale!.toInt()),
        ),
      ],
    );
  }
}
