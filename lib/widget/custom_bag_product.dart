import 'package:app_store/models/cart_model.dart';
import 'package:app_store/services/cart_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomBagProduct extends StatefulWidget {
  const CustomBagProduct(this.item, {super.key, required this.index});
  final CartItem item;
  final int index;

  @override
  State<CustomBagProduct> createState() => _CustomBagProductState();
}

class _CustomBagProductState extends State<CustomBagProduct> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.only(right: 14, top: 50, left: 14),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10,
        children: [
          Text(
            'Products',
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight(700),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            spacing: 10,

            children: [
              Image.network(width: 130, widget.item.product.image),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      widget.item.product.title,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight(600),
                      ),
                      textAlign: TextAlign.start,
                    ),
                    Text(
                      widget.item.product.category,
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
                          '\$ ${widget.item.product.price}',
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
                          onPressed: () {
                            setState(() {
                              widget.item.quininty--;
                              CartService.cartItems.removeAt(widget.index);
                            });
                          },
                          child: Icon(Icons.minimize, color: Colors.white),
                        ),

                        SizedBox(
                          width: 20,
                          child: Center(
                            child: Text(
                              '${widget.item.quininty}',
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
                          onPressed: () {
                            setState(() {
                              widget.item.quininty++;
                            });
                          },
                          child: Icon(Icons.add, color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
