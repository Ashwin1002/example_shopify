import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopify_flutter/shopify_flutter.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final shopifyStore = ShopifyStore.instance;

  ProductBloc() : super(ProductInitial()) {
    on<ProductEvent>((event, emit) async {
      if (event is FetchProductCategoriesEvent) {
        await _fetchProductCategories(emit, event);
      }

      if (event is FetchProductListEvent) {
        await _fetchProductList(emit, event);
      }
    });
  }

  Future<void> _fetchProductCategories(
      Emitter<ProductState> emit, FetchProductCategoriesEvent event) async {
    try {
      emit(ProductCategoryLoading());
      final collections = await shopifyStore.getAllCollections();

      if (collections.isNotEmpty) {
        emit(ProductCategoryLoaded(collectionList: collections));
      } else {
        emit(const ProductCategoryError(message: "No Data Found"));
      }
    } catch (e) {
      emit(ProductCategoryError(message: e.toString()));
    }
  }

  Future<void> _fetchProductList(
      Emitter<ProductState> emit, FetchProductListEvent event) async {
    try {
      final shopifyStore = ShopifyStore.instance;
      final products =
          await shopifyStore.getXProductsAfterCursorWithinCollection(
        event.collectionId,
        event.limit,
        startCursor: null,
        sortKey: SortKeyProductCollection.RELEVANCE,
      );

      if (products != null && products.isNotEmpty) {
        emit(ProductListLoaded(productList: products));
      } else {
        emit(const ProductListError(message: "No Data Found."));
      }
    } catch (e) {
      emit(ProductCategoryError(message: e.toString()));
    }
  }
}
