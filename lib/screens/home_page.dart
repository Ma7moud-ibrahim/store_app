import 'package:app_store/models/product_model.dart';
import 'package:app_store/services/get_all_product_service.dart';
import 'package:app_store/widget/custom_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const String id = 'HomePage';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController searchController = TextEditingController();

  String searchProduct = '';
  late Future<List<ProductModel>> productsFuture;

  @override
  void initState() {
    super.initState();
    productsFuture = AllProductService().getAllProducts();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Trend"),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            children: [
              const SizedBox(height: 20),

              TextField(
                controller: searchController,
                onChanged: (value) {
                  setState(() {
                    searchProduct = value.toLowerCase();
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Search Product',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              FutureBuilder<List<ProductModel>>(
                future: productsFuture,

                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.hasError) {
                    return Center(
                      child: Text('Failed to load products: ${snapshot.error}'),
                    );
                  }

                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No products found'));
                  }

                  final products = snapshot.data!;

                  final filteredProducts = products.where((product) {
                    return product.title.toLowerCase().contains(searchProduct);
                  }).toList();

                  if (filteredProducts.isEmpty) {
                    return const Center(child: Text('No matching products'));
                  }

                  return GridView.builder(
                    clipBehavior: Clip.none,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: filteredProducts.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1.3,
                          mainAxisSpacing: 60,
                          crossAxisSpacing: 5,
                        ),
                    itemBuilder: (context, index) {
                      return CustomCard(productModel: filteredProducts[index]);
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
