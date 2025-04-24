part of 'products_cubit.dart';

sealed class ProductsState extends Equatable {}

final class ProductsInitial extends ProductsState {
  @override
  List<Object?> get props => [];
}

final class ProductsLoading extends ProductsState {
  @override
  List<Object?> get props => [];
}

final class ProductsSuccess extends ProductsState {
  @override
  List<Object?> get props => [];
}

final class ProductsFailure extends ProductsState {
  final String message;

  ProductsFailure({required this.message});

  @override
  List<Object?> get props => [message];
}
