import 'package:e_commerce_app/core/managers/products_cubit/products_cubit.dart';
import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:e_commerce_app/views/home/ui/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesViewWidget extends StatelessWidget {
  const FavoritesViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsCubit()..getAllProducts(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SafeArea(
          child: CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(child: SizedBox(height: 16)),
              const SliverToBoxAdapter(
                child: Text(
                  'Your favorite products',
                  style: AppTextStyles.bold16,
                  textAlign: TextAlign.center,
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 16)),
              BlocBuilder<ProductsCubit, ProductsState>(
                builder: (context, state) {
                  var cubit = context.read<ProductsCubit>();
                  if (cubit.favoriteProducts.isEmpty) {
                    return const SliverToBoxAdapter(
                      child: Center(
                        child: Text(
                          'No favorite products yet',
                          style: AppTextStyles.regular20,
                        ),
                      ),
                    );
                  } else {
                    return SliverToBoxAdapter(
                      child: Column(
                        children: List.generate(cubit.finalPesults.length, (
                          index,
                        ) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: ProductItem(
                              product: cubit.favoriteProductsList[index],
                            ),
                          );
                        }),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
