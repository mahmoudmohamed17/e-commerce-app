part of 'products_cubit.dart';

sealed class ProductsState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class ProductsInitial extends ProductsState {}

final class ProductsLoading extends ProductsState {}

final class ProductsSuccess extends ProductsState {
  final List<ProductModel> products;

  ProductsSuccess({required this.products});

  @override
  List<Object?> get props => [];
}

final class ProductsFailure extends ProductsState {
  final String message;

  ProductsFailure({required this.message});

  @override
  List<Object?> get props => [message];
}

final class ToggleFavoriteSuccess extends ProductsState {}

final class ToggleFavoriteFailure extends ProductsState {}
