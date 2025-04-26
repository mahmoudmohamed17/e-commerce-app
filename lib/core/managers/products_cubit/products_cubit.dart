import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/models/product_model/product_model.dart';
import 'package:e_commerce_app/core/services/api_service.dart';
import 'package:e_commerce_app/core/services/supabase_service.dart';
import 'package:e_commerce_app/core/utils/app_constants.dart';
import 'package:equatable/equatable.dart';
part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsInitial());
  final _apiService = ApiService();

  List<ProductModel> products = [];
  List<ProductModel> results = [];

  Future<void> getAllProducts({String? query, String? category}) async {
    emit(ProductsLoading());
    try {
      var data = await _apiService.get(
        endpoint: AppConstants.productsTable,
        queryParameters: {'select': '*,favorite_products(*),purchases(*)'},
      );
      products = data.map((e) => ProductModel.fromJson(e)).toList();
      if (query != null) {
        results = search(query);
      }
      if (category != null) {
        results = searchByCategory(category);
      }
      if (query == null && category == null) {
        results = products;
      }
      emit(ProductsSuccess(products: results));
    } catch (e) {
      log('Error: $e');
      emit(ProductsFailure(message: e.toString()));
    }
  }

  Map<String, bool> favoriteProducts = {}; // Related to one product only
  Future<void> addProductToFavorites(ProductModel product) async {
    try {
      favoriteProducts.addAll({product.productId!: true});
      if (product.favoriteProducts == null) {
        await _apiService.post(
          data: {
            'for_user': SupabaseService.supabaseClient.auth.currentUser?.id,
            'for_product': product.productId,
            'is_favorite': true,
          },
          endpoint: AppConstants.favoriteProductsTable,
        );
      } else {
        await _apiService.patch(
          data: {'is_favorite': true},
          endpoint: AppConstants.favoriteProductsTable,
          queryParameters: {
            'for_user': SupabaseService.supabaseClient.auth.currentUser?.id,
            'for_product': product.productId,
          },
        );
      }
      emit(ToggleFavoriteSuccess());
    } catch (e) {
      emit(ToggleFavoriteFailure());
    }
  }

  Future<void> removeProductFromFavorites(ProductModel product) async {
    try {
      favoriteProducts.addAll({product.productId!: false});
      await _apiService.patch(
        data: {'is_favorite': true},
        endpoint: AppConstants.favoriteProductsTable,
        queryParameters: {
          'for_user': SupabaseService.supabaseClient.auth.currentUser?.id,
          'for_product': product.productId,
        },
      );
      emit(ToggleFavoriteSuccess());
    } catch (e) {
      emit(ToggleFavoriteFailure());
    }
  }

  List<ProductModel> search(String? query) {
    if (query != null) {
      final filteredProducts =
          products
              .where(
                (product) => product.productName!.toLowerCase().contains(
                  query.toLowerCase(),
                ),
              )
              .toList();
      return filteredProducts;
    } else {
      return products;
    }
  }

  List<ProductModel> searchByCategory(String? category) {
    if (category != null) {
      final result =
          products
              .where((product) => product.productCategory!.trim() == category)
              .toList();
      return result;
    } else {
      return products;
    }
  }

  bool checkIsFavorite(String productId) {
    return favoriteProducts[productId] ?? false;
  }
}
