import 'package:app_store/models/product_model.dart';

class CartItem {
  final ProductModel product;
  int quininty;
  CartItem({required this.product, this.quininty = 1});
}
