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
    Center(child: Text('Profile Screen')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Category',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
