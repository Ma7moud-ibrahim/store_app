import 'package:app_store/helper/api.dart';
import 'package:app_store/models/product_model.dart';

class UpdateProductService {
  Future<ProductModel> updateProduct({
    required dynamic id,
    required String title,
    required String price,
    required String desc,
    required String image,
    required String category,
  }) async {
    Map<String, dynamic> data = await Api().put(
      uri: 'https://dummyjson.com/products/$id',
      body: {
        'title': title,
        'price': price,
        'description': desc,
        'thumbnail': image,
        'category': category,
      },
    );

    return ProductModel.fromJson(data);
  }
}
