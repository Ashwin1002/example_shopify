import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopify_dohan/src/products/bloc/product_bloc.dart';
import 'package:shopify_dohan/src/products/view/product_list.dart';

class ProductCategoryListScreen extends StatelessWidget {
  const ProductCategoryListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Collections')),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductCategoryLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is ProductCategoryLoaded) {
            return ListView.builder(
              itemCount: state.collectionList.length,
              itemBuilder: (_, int index) {
                final indexItem = state.collectionList[index];
                return ListTile(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CollectionDetailScreen(
                        collectionId: indexItem.id,
                        collectionTitle: indexItem.title,
                      ),
                    ),
                  ),
                  title: Text(indexItem.title),
                );
              },
            );
          }
          if (state is ProductCategoryError) {
            return Center(
              child: Text(state.message),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
