import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProductRatingBar extends StatelessWidget {
  const ProductRatingBar({super.key});

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: 3,
      minRating: 1,
      itemBuilder:
          (context, _) =>
              const Icon(FontAwesomeIcons.solidStar, color: Colors.amber),
      itemSize: 20.0,
      itemPadding: const EdgeInsets.only(right: 16),
      onRatingUpdate: (rating) {},
    );
  }
}
