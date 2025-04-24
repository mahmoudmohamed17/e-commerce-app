import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/services/api_service.dart';
import 'package:e_commerce_app/core/utils/app_constants.dart';
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
      log('Data: $data');
      emit(ProductsSuccess());
    } catch (e) {
      emit(ProductsFailure(message: e.toString()));
    }
  }
}
