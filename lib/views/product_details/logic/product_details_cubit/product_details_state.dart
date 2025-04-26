part of 'product_details_cubit.dart';

sealed class ProductDetailsState extends Equatable {
  const ProductDetailsState();

  @override
  List<Object> get props => [];
}

final class ProductDetailsInitial extends ProductDetailsState {}

final class GetProductRateLoading extends ProductDetailsState {}

final class GetProductRateSuccess extends ProductDetailsState {}

final class GetProductRateFailure extends ProductDetailsState {
  final String message;

  const GetProductRateFailure({required this.message});

  @override
  List<Object> get props => [message];
}

final class ToggleRateLoading extends ProductDetailsState {}

final class ToggleRateSuccess extends ProductDetailsState {}

final class ToggleRateFailure extends ProductDetailsState {
  final String message;

  const ToggleRateFailure({required this.message});

  @override
  List<Object> get props => [message];
}
final class AddCommentLoading extends ProductDetailsState {}

final class AddCommentSuccess extends ProductDetailsState {}

final class AddCommentFailure extends ProductDetailsState {
  final String message;

  const AddCommentFailure({required this.message});

  @override
  List<Object> get props => [message];
}
