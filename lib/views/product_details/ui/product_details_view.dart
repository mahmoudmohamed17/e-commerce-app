import 'package:e_commerce_app/core/helpers/build_app_bar.dart';
import 'package:e_commerce_app/core/helpers/navigation_extension.dart';
import 'package:e_commerce_app/core/helpers/routes.dart';
import 'package:e_commerce_app/core/helpers/snack_bar.dart';
import 'package:e_commerce_app/core/models/product_model/product_model.dart';
import 'package:e_commerce_app/views/product_details/logic/product_details_cubit/product_details_cubit.dart';
import 'package:e_commerce_app/views/product_details/ui/product_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key, required this.product});
  static const String id = Routes.productDetailsView;
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              ProductDetailsCubit()..getProductRates(product.productId!),
      child: Scaffold(
        appBar: buildAppBar(context, 'Product Details'),
        body: BlocConsumer<ProductDetailsCubit, ProductDetailsState>(
          listener: (context, state) {
            if (state is GetProductRateFailure) {
              snackBar(context, state.message);
            }
            if (state is ToggleRateFailure) {
              snackBar(context, state.message);
            }
            if (state is ToggleRateSuccess) {
              context.pushReplacementNamed(ProductDetailsView.id, arguments: product);
            }
          },
          builder: (context, state) {
            return state is GetProductRateLoading || state is ToggleRateLoading
                ? const Center(child: CircularProgressIndicator())
                : ProductDetailsViewBody(product: product);
          },
        ),
      ),
    );
  }
}
