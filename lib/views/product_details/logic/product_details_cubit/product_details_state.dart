part of 'product_details_cubit.dart';

sealed class ProductDetailsState extends Equatable {
  const ProductDetailsState();

  @override
  List<Object> get props => [];
}

final class ProductDetailsInitial extends ProductDetailsState {}

final class GetProductRateLoading extends ProductDetailsState {}

final class GetProductRateSuccess extends ProductDetailsState {}

final class GetProductRateFailure extends ProductDetailsState {}
