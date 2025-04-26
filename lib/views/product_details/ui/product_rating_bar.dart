import 'package:e_commerce_app/views/product_details/logic/product_details_cubit/product_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class ProductRatingBar extends StatelessWidget {
  const ProductRatingBar({
    super.key,
    required this.currentRate,
    required this.productId,
  });
  final double currentRate;
  final String productId;

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: currentRate,
      minRating: 1,
      itemBuilder:
          (context, _) =>
              const Icon(FontAwesomeIcons.solidStar, color: Colors.amber),
      itemSize: 20.0,
      itemPadding: const EdgeInsets.only(right: 16),
      onRatingUpdate: (rating) {
        context.read<ProductDetailsCubit>().toggleRate(
          productId: productId,
          rate: rating,
        );
      },
    );
  }
}
