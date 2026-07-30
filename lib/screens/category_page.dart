import 'package:app_store/models/product_model.dart';
import 'package:app_store/services/get_all_category_service.dart';
import 'package:app_store/widget/custom_card_category.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});
  static String id = 'CategoryPage';

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text('Category', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 50),
        child: FutureBuilder<List<ProductModel>>(
          future: AllCategoryService().getAllCategoryService(),
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

            return GridView.builder(
              itemCount: snapshot.data!.length,
              clipBehavior: Clip.none,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.3,
                mainAxisSpacing: 60,
                crossAxisSpacing: 5,
              ),
              itemBuilder: (context, index) {
                return CustomCardCategory(productModel: snapshot.data![index]);
              },
            );
          },
        ),
      ),
    );
  }
}
