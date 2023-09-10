part of 'product_bloc.dart';

sealed class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class FetchProductCategoriesEvent extends ProductEvent {
  const FetchProductCategoriesEvent();

  @override
  List<Object> get props => [];
}

class FetchProductListEvent extends ProductEvent {
  const FetchProductListEvent({
    required this.collectionId,
    this.limit = 20,
  });

  final String collectionId;

  final int limit;

  @override
  List<Object> get props => [collectionId];
}
