import 'package:e_commerce_app/core/managers/products_cubit/products_cubit.dart';
import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:e_commerce_app/views/home/ui/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecentlyProductsList extends StatelessWidget {
  const RecentlyProductsList({super.key, this.query, this.category});
  final String? query;
  final String? category;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              ProductsCubit()..getAllProducts(query: query, category: category),
      child: BlocBuilder<ProductsCubit, ProductsState>(
        builder: (context, state) {
          var cubit = context.read<ProductsCubit>();
          switch (state) {
            case ProductsInitial():
            case ProductsLoading():
              return const Center(child: CircularProgressIndicator());
            case ProductsSuccess():
            case ToggleFavoriteSuccess():
              return Column(
                children: List.generate(cubit.finalPesults.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: ProductItem(product: cubit.finalPesults[index]),
                  );
                }),
              );
            case ProductsFailure():
            case ToggleFavoriteFailure():
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
