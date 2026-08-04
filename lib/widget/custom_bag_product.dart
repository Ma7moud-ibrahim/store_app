import 'package:app_store/models/cart_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomBagProduct extends StatelessWidget {
  const CustomBagProduct(
    this.item, {
    super.key,
    required this.onAdd,
    required this.onRemove,
  });
  final CartItem item;
  final VoidCallback onAdd;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.only(right: 14, top: 25, left: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        spacing: 10,

        children: [
          Image.network(width: 130, item.product.image),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  item.product.title,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight(600),
                  ),
                  textAlign: TextAlign.start,
                ),
                Text(
                  item.product.category,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight(600),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$ ${item.product.price}',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: CupertinoColors.activeGreen,
                      ),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: CupertinoColors.destructiveRed,
                        alignment: Alignment.topCenter,
                      ),
                      onPressed: onRemove,
                      child: Icon(Icons.minimize, color: Colors.white),
                    ),

                    SizedBox(
                      width: 20,
                      child: Center(
                        child: Text(
                          '${item.quantity}',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: CupertinoColors.activeGreen,
                      ),
                      onPressed: onAdd,
                      child: Icon(Icons.add, color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
