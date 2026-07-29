class ProductModel {
  final String id;
  final String title;
  final double price;
  final String descreption;
  final String image;
  final String category;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.descreption,
    required this.image,
    required this.category,
  });

  factory ProductModel.fromJson(dynamic jsonDate) {
    String? imageUrl;
    final dynamic rawImage = jsonDate['image'];
    if (rawImage is String && rawImage.isNotEmpty) {
      imageUrl = rawImage;
    } else {
      final dynamic thumbnail = jsonDate['thumbnail'];
      if (thumbnail is String && thumbnail.isNotEmpty) {
        imageUrl = thumbnail;
      } else if (jsonDate['images'] is List &&
          (jsonDate['images'] as List).isNotEmpty) {
        final firstImage = (jsonDate['images'] as List).first;
        if (firstImage is String && firstImage.isNotEmpty) {
          imageUrl = firstImage;
        }
      }
    }

    final rawPrice = jsonDate['price'];
    double priceValue = 0.0;
    if (rawPrice is num) {
      priceValue = rawPrice.toDouble();
    } else if (rawPrice is String) {
      priceValue = double.tryParse(rawPrice) ?? 0.0;
    }

    return ProductModel(
      id: jsonDate['id'].toString(),
      title: jsonDate['title'] as String? ?? '',
      price: priceValue,
      descreption:
          (jsonDate['description'] as String? ??
          jsonDate['descreption'] as String? ??
          ''),
      image: imageUrl ?? '',
      category: jsonDate['category'] as String? ?? '',
    );
  }
}

class RatingModel {
  final double rate;
  final int count;

  RatingModel({required this.rate, required this.count});
  factory RatingModel.fromJson(dynamic jsonDate) {
    return RatingModel(
      rate: (jsonDate['rate'] as num?)?.toDouble() ?? 0.0,
      count: jsonDate['count'] as int? ?? 0,
    );
  }
}
