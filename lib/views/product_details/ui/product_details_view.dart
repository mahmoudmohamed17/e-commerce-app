import 'package:e_commerce_app/core/helpers/build_app_bar.dart';
import 'package:e_commerce_app/core/helpers/routes.dart';
import 'package:e_commerce_app/views/product_details/ui/product_details_view_body.dart';
import 'package:flutter/material.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});
  static const String id = Routes.productDetailsView;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, 'Product Details'),
      body: const ProductDetailsViewBody()
    );
  }
}
