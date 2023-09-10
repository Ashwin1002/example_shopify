part of 'product_bloc.dart';

sealed class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

final class ProductInitial extends ProductState {}

final class ProductCategoryLoading extends ProductState {}

final class ProductCategoryLoaded extends ProductState {
  const ProductCategoryLoaded({required this.collectionList});
  final List<Collection> collectionList;

  @override
  List<Object> get props => [collectionList];
}

final class ProductCategoryError extends ProductState {
  const ProductCategoryError({required this.message});
  final String message;

  @override
  List<Object> get props => [message];
}

final class ProductListLoading extends ProductState {}

final class ProductListLoaded extends ProductState {
  const ProductListLoaded({required this.productList});
  final List<Product> productList;

  @override
  List<Object> get props => [productList];
}

final class ProductListError extends ProductState {
  const ProductListError({required this.message});
  final String message;

  @override
  List<Object> get props => [message];
}
