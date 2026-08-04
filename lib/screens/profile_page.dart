import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  static final id = 'ProfilePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('More')),
      body: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 40,

                backgroundImage: NetworkImage(
                  'https://cdn.dummyjson.com/product-images/beauty/essence-mascara-lash-princess/1.webp',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
