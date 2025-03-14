import 'package:e_commerce_app/core/helpers/assets.dart';
import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:e_commerce_app/views/product_details/ui/comments_section_widget.dart';
import 'package:e_commerce_app/views/product_details/ui/custom_send_comment_text_field.dart';
import 'package:e_commerce_app/views/product_details/ui/product_name_and_price.dart';
import 'package:e_commerce_app/views/product_details/ui/product_rate_and_heart_button.dart';
import 'package:e_commerce_app/views/product_details/ui/product_rating_bar.dart';
import 'package:flutter/material.dart';

class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Image.asset(
            Assets.imagesProduct,
            height: 250,
            fit: BoxFit.fill,
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
        const SliverToBoxAdapter(
          child: Text(
            'Product Desription',
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
