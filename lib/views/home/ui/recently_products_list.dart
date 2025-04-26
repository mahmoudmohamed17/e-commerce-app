import 'package:e_commerce_app/core/managers/products_cubit/products_cubit.dart';
import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:e_commerce_app/views/home/ui/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecentlyProductsList extends StatelessWidget {
  const RecentlyProductsList({super.key, this.query});
  final String? query;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsCubit()..getAllProducts(query: query),
      child: BlocBuilder<ProductsCubit, ProductsState>(
        builder: (context, state) {
          switch (state) {
            case ProductsInitial():
            case ProductsLoading():
              return const Center(child: CircularProgressIndicator());
            case ProductsSuccess():
              return Column(
                children: List.generate(state.products.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: ProductItem(product: state.products[index]),
                  );
                }),
              );
            case ProductsFailure():
              return const Center(
                child: Text(
                  'Error loading products',
                  style: AppTextStyles.regular20,
                ),
              );
          }
        },
      ),
    );
  }
}
