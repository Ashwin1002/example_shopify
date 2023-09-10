import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopify_dohan/src/products/bloc/product_bloc.dart';
import 'package:shopify_dohan/src/products/view/product_category_list.dart';
import 'package:shopify_flutter/shopify_config.dart';

void main() {
  ShopifyConfig.setConfig(
    storefrontAccessToken: '12759dcea3d291ad8ba77fd7b55b27e3',
    storeUrl: 'd6ebe5-2.myshopify.com',
    // adminAccessToken: "shpat_*******************", // optional
    // storefrontApiVersion: '2023-07', // optional
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProductBloc()
        ..add(
          const FetchProductCategoriesEvent(),
        ),
      child: MaterialApp(
        title: 'Dohans Qatar',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const ProductCategoryListScreen(),
      ),
    );
  }
}
