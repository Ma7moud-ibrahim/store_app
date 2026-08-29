import 'package:app_store/firebase_options.dart';
import 'package:app_store/screens/bag_page.dart';
import 'package:app_store/screens/login_page.dart';
import 'package:app_store/screens/login_page_verfection.dart';
import 'package:app_store/screens/product_details.dart';
import 'package:app_store/screens/profile_page.dart';
import 'package:app_store/screens/register_page.dart';
import 'package:app_store/screens/register_page_password.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:app_store/screens/category_page.dart';
import 'package:app_store/screens/home_page.dart';
import 'package:app_store/screens/ubdate_product_page.dart';
import 'package:app_store/screens/bottom_navigation_bar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const AppStore());
}

class AppStore extends StatelessWidget {
  const AppStore({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Store',
      debugShowCheckedModeBanner: false,
      initialRoute: LoginPage.id,
      routes: {
        NavigationBarScreens.id: (_) => const NavigationBarScreens(),
        HomePage.id: (_) => const HomePage(),
        CategoryPage.id: (_) => const CategoryPage(),
        UpdateProductPage.id: (_) => const UpdateProductPage(),
        ProductDetails.id: (_) => ProductDetails(),
        BagPage.id: (_) => BagPage(),
        ProfilePage.id: (_) => ProfilePage(),
        LoginPage.id: (_) => LoginPage(),
        LoginPageVerfection.id: (_) => LoginPageVerfection(),
        RegisterPage.id: (_) => RegisterPage(),
        RegisterPagePassword.id: (_) => RegisterPagePassword(),
      },
    );
  }
}
