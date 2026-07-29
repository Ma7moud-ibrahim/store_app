import 'package:app_store/helper/api.dart';
import 'package:app_store/models/product_model.dart';

class CategoryiesService {
  Future<List<ProductModel>> categoriesServiceProducts({
    required String categoryName,
  }) async {
    List<dynamic> data = await Api().get(
      uri: 'https://fakestoreapi.com/products/categories/$categoryName',
    );

    List<ProductModel> prodctList = [];
    for (var element in data) {
      prodctList.add(ProductModel.fromJson(element));
    }
    return prodctList;
  }
}
