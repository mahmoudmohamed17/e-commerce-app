import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/services/api_service.dart';
import 'package:e_commerce_app/core/utils/app_constants.dart';
import 'package:e_commerce_app/views/product_details/logic/models/rate_model.dart';
import 'package:equatable/equatable.dart';

part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit() : super(ProductDetailsInitial());

  final _apiService = ApiService();

  /// Note: We get all the product's rates using its id
  /// Then we could make additional filtering on the client side
  /// to get the rates for the current user
  Future<void> getProductRates(String productId) async {
    emit(GetProductRateLoading());
    try {
      var data = await _apiService.get(
        endpoint: AppConstants.ratesTable,
        queryParameters: {'select': '*', 'for_product': 'eq.$productId'},
      );
      var rates = data.map((e) => RateModel.fromJson(e)).toList();
      var productAvgRate = getAverageRate(rates);
      emit(GetProductRateSuccess(productAvgRate: productAvgRate));
    } catch (e) {
      emit(GetProductRateFailure(message: e.toString()));
    }
  }

  double getAverageRate(List<RateModel> rates) {
    if (rates.isEmpty) return 0;
    double total = 0;
    for (var rate in rates) {
      total += rate.rate!;
    }
    return total / rates.length;
  }
}
