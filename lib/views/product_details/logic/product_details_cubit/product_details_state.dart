part of 'product_details_cubit.dart';

sealed class ProductDetailsState extends Equatable {
  const ProductDetailsState();

  @override
  List<Object> get props => [];
}

final class ProductDetailsInitial extends ProductDetailsState {}

final class GetProductRateLoading extends ProductDetailsState {}

final class GetProductRateSuccess extends ProductDetailsState {
  final List<RateModel> rates;

  const GetProductRateSuccess({required this.rates});

  @override
  List<Object> get props => [rates];
}

final class GetProductRateFailure extends ProductDetailsState {
  final String message;

  const GetProductRateFailure({required this.message});

  @override
  List<Object> get props => [message];
}
