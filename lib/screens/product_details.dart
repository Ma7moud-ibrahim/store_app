import 'package:app_store/models/product_model.dart';
import 'package:app_store/widget/custom_product_details.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  // Marked constructor as const
  const ProductDetails({super.key});

  static const String id = 'ProductDetails';

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  late ProductModel product;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    product = ModalRoute.of(context)!.settings.arguments as ProductModel;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Product Details"),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: CustomProductDetails(product: product),
    );
  }
}
