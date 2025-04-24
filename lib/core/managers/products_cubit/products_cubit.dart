import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/models/product_model/product_model.dart';
import 'package:e_commerce_app/core/services/api_service.dart';
import 'package:e_commerce_app/core/utils/app_constants.dart';
import 'package:e_commerce_app/core/utils/parse_products_data.dart';
import 'package:equatable/equatable.dart';
part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsInitial());
  final _apiService = ApiService();

  Future<void> getAllProducts() async {
    emit(ProductsLoading());
    try {
      var data = await _apiService.get(
        endpoint: '${AppConstants.productsTable}?select=*',
      );
      var products = parseProductsData(data);
      log('Products: $products');
      emit(ProductsSuccess(products: products));
    } catch (e) {
      emit(ProductsFailure(message: e.toString()));
    }
  }

  Future<void> addProduct(ProductModel product) async {

  }
}
