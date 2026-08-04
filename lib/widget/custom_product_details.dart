import 'package:app_store/models/product_model.dart';
import 'package:app_store/services/cart_service.dart';
import 'package:app_store/widget/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomProductDetails extends StatelessWidget {
  const CustomProductDetails({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 300,
            width: double.infinity,
            child: Image.network(
              product.image,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.broken_image, size: 80, color: Colors.grey),
            ),
          ),
          const SizedBox(height: 20),

          // Product Title
          Text(
            product.title,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),

          // Rating and Price Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.star, color: Colors.amber, size: 22),
                  const SizedBox(width: 4),
                  Text(
                    // Access rate directly if rating is an object, or use productModel.rating
                    ' Rating ${product.rating}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Text(
                '\$${product.price}',
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: CupertinoColors.activeGreen,
                ),
              ),
            ],
          ),
          const SizedBox(height: 25),

          // Description Section
          const Text(
            'Description',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 8),

          Text(
            product.descreption,
            style: const TextStyle(
              fontSize: 16,
              height: 1.4, // Line height for better readability
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 170),

          CustomButton(
            onPressed: () {
              CartService.addToCart(product);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Product added to bag.'),
                  duration: Duration(seconds: 2),
                ),
              );
            },
            text: 'Add to Bag',
            color: CupertinoColors.activeGreen,
          ),
        ],
      ),
    );
  }
}
