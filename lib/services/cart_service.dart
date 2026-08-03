import 'package:app_store/models/cart_model.dart';
import 'package:app_store/models/product_model.dart';

class CartService {
  static List<CartItem> cartItems = [];

  static void addToCart(ProductModel product) {
    cartItems.add(CartItem(product: product));
  }
}
