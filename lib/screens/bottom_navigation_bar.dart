import 'package:app_store/screens/bag_page.dart';
import 'package:app_store/screens/category_page.dart';
import 'package:app_store/screens/home_page.dart';
import 'package:flutter/material.dart';

class NavigationBarScreens extends StatefulWidget {
  static String id = 'NavigationBarScreens';

  const NavigationBarScreens({super.key});

  @override
  State<NavigationBarScreens> createState() => _NavigationBarScreensState();
}

class _NavigationBarScreensState extends State<NavigationBarScreens> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    HomePage(),
    CategoryPage(),
    BagPage(),
    Center(child: Text('Profile Screen')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        indicatorColor: Colors.green,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.category_outlined),
            selectedIcon: Icon(Icons.category),
            label: 'Category',
          ),
          NavigationDestination(
            icon: Icon(Icons.shopping_bag_outlined),
            selectedIcon: Icon(Icons.shopping_bag),
            label: 'Bag',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
