import 'package:app_store/helper/api.dart';
import 'package:app_store/models/product_model.dart';

class AllProductService {
  Future<List<ProductModel>> getAllProducts() async {
    final response = await Api().get(uri: 'https://dummyjson.com/products');

    if (response is! Map<String, dynamic> || response['products'] is! List) {
      throw Exception('Unexpected response format from products API');
    }

    final products = response['products'] as List;
    return products
        .map<ProductModel>((product) => ProductModel.fromJson(product))
        .toList();
  }
}
