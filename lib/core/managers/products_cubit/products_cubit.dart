import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/models/product_model/product_model.dart';
import 'package:e_commerce_app/core/services/api_service.dart';
import 'package:e_commerce_app/core/utils/app_constants.dart';
import 'package:equatable/equatable.dart';
part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsInitial());
  final _apiService = ApiService();

  List<ProductModel> products = [];
  List<ProductModel> result = [];

  Future<void> getAllProducts({String? query, String? category}) async {
    emit(ProductsLoading());
    try {
      var data = await _apiService.get(
        endpoint: AppConstants.productsTable,
        queryParameters: {'select': '*,favorite_products(*),purchases(*)'},
      );
      products = data.map((e) => ProductModel.fromJson(e)).toList();
      if (query != null) {
        result = search(query);
      }
      if (category != null) {
        result = searchByCategory(category);
      }
      if (query == null && category == null) {
        result = products;
      }
      emit(ProductsSuccess(products: result));
    } catch (e) {
      log('Error: $e');
      emit(ProductsFailure(message: e.toString()));
    }
  }

  Future<void> addProduct(ProductModel product) async {}

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
}
