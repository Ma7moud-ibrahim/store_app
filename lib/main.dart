import 'package:app_store/screens/product_details.dart';
import 'package:flutter/material.dart';

import 'package:app_store/screens/category_page.dart';
import 'package:app_store/screens/home_page.dart';
import 'package:app_store/screens/ubdate_product_page.dart';
import 'package:app_store/screens/bottom_navigation_bar.dart';

void main() {
  runApp(const AppStore());
}

class AppStore extends StatelessWidget {
  const AppStore({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Store',
      debugShowCheckedModeBanner: false,
      initialRoute: NavigationBarScreens.id,
      routes: {
        NavigationBarScreens.id: (_) => const NavigationBarScreens(),
        HomePage.id: (_) => const HomePage(),
        CategoryPage.id: (_) => const CategoryPage(),
        UpdateProductPage.id: (_) => const UpdateProductPage(),
        ProductDetails.id: (_) => ProductDetails(),
      },
    );
  }
}
