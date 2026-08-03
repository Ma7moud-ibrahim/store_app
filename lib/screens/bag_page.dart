import 'package:app_store/services/cart_service.dart';
import 'package:app_store/widget/custom_bag_product.dart';
import 'package:flutter/material.dart';

class BagPage extends StatefulWidget {
  const BagPage({super.key});
  static final String id = 'BagPage';
  @override
  State<BagPage> createState() => _BagPageState();
}

class _BagPageState extends State<BagPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Bag',
          style: TextStyle(
            color: Colors.black,
            fontSize: 30,
            fontWeight: FontWeight(600),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: CartService.cartItems.length,
        itemBuilder: (context, index) {
          final item = CartService.cartItems[index];
          return CustomBagProduct(item, index: index);
        },
      ),
    );
  }
}
