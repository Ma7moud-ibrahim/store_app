import 'package:app_store/screens/category_page.dart';
import 'package:app_store/screens/home_page.dart';
import 'package:app_store/screens/ubdate_product_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const AppStore());
}

class AppStore extends StatelessWidget {
  const AppStore({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomePage.id: (context) => HomePage(),
        UpdateProductPage.id: (context) => UpdateProductPage(),
        CategoryPage.id: (context) => CategoryPage(),
      },
      initialRoute: CategoryPage.id,
    );
  }
}
