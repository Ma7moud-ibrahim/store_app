import 'package:app_store/models/product_model.dart';
import 'package:app_store/screens/product_details.dart';
// import 'package:app_store/screens/ubdate_product_page.dart';
import 'package:flutter/material.dart';

class CustomCardCategory extends StatelessWidget {
  const CustomCardCategory({super.key, required this.productModel});
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          ProductDetails.id,
          arguments: productModel,
        );
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            width: 190,
            height: 110,
            child: Card(
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 110,
                          child: Center(
                            child: Text(
                              productModel.title,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    // const Icon(Icons.favorite, color: Colors.red),
                  ],
                ),
              ),
            ),
          ),

          Positioned(
            top: -40,
            right: 45,
            child: productModel.image.startsWith('http')
                ? Image.network(
                    productModel.image,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: 72,
                        height: 72,
                        color: Colors.grey,
                        child: const Icon(Icons.broken_image),
                      );
                    },
                  )
                : Image.asset(
                    productModel.image,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: 100,
                        height: 100,
                        color: Colors.grey,
                        child: const Icon(Icons.broken_image),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
