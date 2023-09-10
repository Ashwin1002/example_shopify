import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopify_dohan/src/products/bloc/product_bloc.dart';

class CollectionDetailScreen extends StatefulWidget {
  const CollectionDetailScreen(
      {Key? key, required this.collectionId, required this.collectionTitle})
      : super(key: key);
  final String collectionId;
  final String collectionTitle;

  @override
  CollectionDetailScreenState createState() => CollectionDetailScreenState();
}

class CollectionDetailScreenState extends State<CollectionDetailScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ProductBloc>().add(
          FetchProductListEvent(collectionId: widget.collectionId),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.collectionTitle),
      ),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductListLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is ProductListError) {
            return Center(
              child: Text(state.message),
            );
          }
          if (state is ProductListLoaded) {
            return ListView.builder(
              itemCount: state.productList.length,
              itemBuilder: (_, int index) {
                final indexItem = state.productList[index];
                return ListTile(
                  title: Text(indexItem.title),
                  leading: CachedNetworkImage(
                    height: 80,
                    width: 80,
                    imageUrl: indexItem.image,
                  ),
                  subtitle: Text(indexItem.formattedPrice),
                );
              },
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
