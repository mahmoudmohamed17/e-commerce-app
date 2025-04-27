import 'dart:developer';
import 'package:e_commerce_app/core/models/product_model/product_model.dart';
import 'package:e_commerce_app/core/services/api_service.dart';
import 'package:e_commerce_app/core/services/supabase_service.dart';
import 'package:e_commerce_app/core/utils/app_constants.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsInitial());
  final _apiService = ApiService();

  List<ProductModel> tempResult = [];
  List<ProductModel> finalPesults = [];
  var currentUserId = SupabaseService.supabaseClient.auth.currentUser?.id;

  Future<void> getAllProducts({String? query, String? category}) async {
    emit(ProductsLoading());
    try {
      var data = await _apiService.get(
        endpoint: AppConstants.productsTable,
        queryParameters: {'select': '*,favorite_products(*),purchases(*)'},
      );
      tempResult = data.map((e) => ProductModel.fromJson(e)).toList();
      if (query != null) {
        finalPesults = search(query);
      }
      if (category != null) {
        finalPesults = searchByCategory(category);
      }
      if (query == null && category == null) {
        finalPesults = tempResult;
      }
      emit(ProductsSuccess());
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
            'for_user': currentUserId,
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
            'for_user': 'eq.$currentUserId',
            'for_product': 'eq.${product.productId}',
          },
        );
      }
      emit(ToggleFavoriteSuccess());
    } catch (e) {
      log('Error: $e');
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
          'for_user': currentUserId,
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
          tempResult
              .where(
                (product) => product.productName!.toLowerCase().contains(
                  query.toLowerCase(),
                ),
              )
              .toList();
      return filteredProducts;
    } else {
      return tempResult;
    }
  }

  List<ProductModel> searchByCategory(String? category) {
    if (category != null) {
      final result =
          tempResult
              .where((product) => product.productCategory!.trim() == category)
              .toList();
      return result;
    } else {
      return tempResult;
    }
  }

  bool checkIsFavorite(String productId) {
    if (favoriteProducts.isEmpty) {
      final favoriteProduct =
          finalPesults
              .firstWhere((product) => product.productId == productId)
              .favoriteProducts
              ?.first;
      favoriteProduct!.forUser == currentUserId ? true : false;
    }
    return favoriteProducts[productId] ?? false;
  }

  List<ProductModel> favoriteProductsList = [];
  void getFavoriteProducts() {
    favoriteProductsList =
        tempResult.where((product) {
          if (product.favoriteProducts != null && favoriteProducts.isNotEmpty) {
            for (var favoriteProduct in product.favoriteProducts!) {
              if (favoriteProduct.forUser == currentUserId) {
                favoriteProductsList.add(product);
              }
            }
            return true;
          } else {
            return false;
          }
        }).toList();
  }
}
