import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopify_dohan/common/theme/theme_config.dart';
import 'package:shopify_dohan/config/global_variable.dart';
import 'package:shopify_dohan/src/products/bloc/product_bloc.dart';
import 'package:shopify_dohan/src/splash/view/splash_screen.dart';
// import 'package:shopify_dohan/src/products/view/product_category_list.dart';
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dohans Qatar',
      navigatorKey: GlobalVariable.navigatorState,
      scaffoldMessengerKey: GlobalVariable.scaffoldMessengerKey,
      debugShowCheckedModeBanner: false,
      theme: lightTheme(),
      darkTheme: darkTheme(),
      themeMode: ThemeMode.system,
      home: const SplashScreen(),
    );
  }
}
