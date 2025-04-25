import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/services/api_service.dart';
import 'package:e_commerce_app/core/services/supabase_service.dart';
import 'package:e_commerce_app/core/utils/app_constants.dart';
import 'package:e_commerce_app/views/product_details/logic/models/rate_model.dart';
import 'package:equatable/equatable.dart';

part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit() : super(ProductDetailsInitial());

  final _apiService = ApiService();

  /// Note: We get all the product's rates based on its id
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
      var currentUserRate = getCurrentUserRate(rates);
      emit(
        GetProductRateSuccess(
          productAvgRate: productAvgRate,
          currentUserRate: currentUserRate!,
        ),
      );
    } catch (e) {
      log('Error: $e');
      emit(GetProductRateFailure(message: e.toString()));
    }
  }

  double? getCurrentUserRate(List<RateModel> rates) {
    var currentUserId = SupabaseService.supabaseClient.auth.currentUser?.id;
    // 508f31ca-5e5b-43d6-9d10-ca8092a941b6 ==> ibrahim
    if (rates.isNotEmpty) {
      // Additional checks to ensure the current user ID is not null
      // and the rates list is not empty
      var found = rates.where((item) => item.forUser == currentUserId);
      return found.isNotEmpty ? found.first.rate : 0.0;
    } else {
      return 0.0;
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
