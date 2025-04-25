import 'package:e_commerce_app/core/models/product_model/product_model.dart';
import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:e_commerce_app/core/widgets/custom_product_image.dart';
import 'package:e_commerce_app/views/product_details/ui/comments_section_widget.dart';
import 'package:e_commerce_app/views/product_details/ui/custom_send_comment_text_field.dart';
import 'package:e_commerce_app/views/product_details/ui/product_name_and_price.dart';
import 'package:e_commerce_app/views/product_details/ui/product_rate_and_heart_button.dart';
import 'package:e_commerce_app/views/product_details/ui/product_rating_bar.dart';
import 'package:flutter/material.dart';

class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: CustomProductImage(
            imageUrl: product.productImage!,
            height: 250,
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 16)),
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: ProductNameAndPrice(),
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 16)),
        const SliverToBoxAdapter(child: ProductRateAndHeartButton()),
        const SliverToBoxAdapter(child: SizedBox(height: 16)),
        SliverToBoxAdapter(
          child: Text(
            product.productDescription!,
            style: AppTextStyles.regular16,
            textAlign: TextAlign.center,
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 16)),
        const SliverToBoxAdapter(child: Center(child: ProductRatingBar())),
        const SliverToBoxAdapter(child: SizedBox(height: 16)),
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: CustomSendCommentTextField(),
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 16)),
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: CommentsSectionWidget(),
          ),
        ),
      ],
    );
  }
}
