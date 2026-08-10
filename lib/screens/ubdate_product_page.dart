import 'package:app_store/models/product_model.dart';
import 'package:app_store/services/update_product.dart';
import 'package:app_store/widget/custom_button.dart';
import 'package:app_store/widget/custom_text_feild.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class UpdateProductPage extends StatefulWidget {
  const UpdateProductPage({super.key});
  static String id = 'update product';

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  bool isLoading = false;
  late ProductModel product;
  late TextEditingController nameController;
  late TextEditingController descController;
  late TextEditingController priceController;
  late TextEditingController imageController;
  bool _isInitialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_isInitialized) {
      product = ModalRoute.of(context)!.settings.arguments as ProductModel;
      nameController = TextEditingController(text: product.title);
      descController = TextEditingController(text: product.descreption);
      priceController = TextEditingController(text: product.price.toString());
      imageController = TextEditingController(text: product.image);
      _isInitialized = true;
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    descController.dispose();
    priceController.dispose();
    imageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          title: Text('Update Product', style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                SizedBox(height: 150),

                CustomTextField(
                  controller: nameController,
                  onChanged: (_) {},
                  inputType: TextInputType.name,
                  label: 'Product Name',
                ),
                SizedBox(height: 8),
                CustomTextField(
                  controller: descController,
                  onChanged: (_) {},
                  inputType: TextInputType.name,
                  label: 'Description',
                ),
                SizedBox(height: 8),
                CustomTextField(
                  controller: priceController,
                  onChanged: (_) {},
                  inputType: TextInputType.number,
                  label: 'Price',
                ),
                SizedBox(height: 8),
                CustomTextField(
                  controller: imageController,
                  onChanged: (_) {},
                  inputType: TextInputType.url,
                  label: 'Image',
                ),
                SizedBox(height: 25),
                CustomButton(
                  onPressed: () async {
                    final title = nameController.text.trim();
                    final desc = descController.text.trim();
                    final price = priceController.text.trim();
                    final image = imageController.text.trim();

                    if (title.isEmpty ||
                        desc.isEmpty ||
                        price.isEmpty ||
                        image.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please fill all fields.'),
                        ),
                      );
                      return;
                    }

                    setState(() {
                      isLoading = true;
                    });

                    try {
                      await updateProductService(
                        product,
                        title,
                        price,
                        desc,
                        image,
                      );
                      if (!mounted) return;
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Product updated successfully.'),
                        ),
                      );
                    } catch (error) {
                      if (!mounted) return;
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Update failed: $error')),
                      );
                    } finally {
                      if (!mounted) return;
                      setState(() {
                        isLoading = false;
                      });
                    }
                  },

                  text: 'Update',
                  color: const Color.fromARGB(255, 17, 96, 241),
                  icon: Icons.arrow_forward,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateProductService(
    ProductModel product,
    String title,
    String price,
    String desc,
    String image,
  ) async {
    await UpdateProductService().updateProduct(
      id: product.id,
      title: title,
      price: price,
      desc: desc,
      image: image,
      category: product.category,
    );
  }
}
