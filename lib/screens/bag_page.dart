import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BagPage extends StatefulWidget {
  const BagPage({super.key});
  static final String id = 'BagPage';
  @override
  State<BagPage> createState() => _BagPageState();
}

class _BagPageState extends State<BagPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Bag',
          style: TextStyle(
            color: Colors.black,
            fontSize: 30,
            fontWeight: FontWeight(600),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.only(right: 14, top: 50, left: 14),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
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
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.network(
                  width: 125,
                  'https://cdn.dummyjson.com/product-images/beauty/essence-mascara-lash-princess/1.webp',
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Title',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight(600),
                      ),
                    ),
                    Text(
                      'Category',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight(600),
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          '\$price',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: CupertinoColors.activeGreen,
                          ),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: CupertinoColors.destructiveRed,
                          ),
                          onPressed: () {},
                          child: Icon(Icons.minimize, color: Colors.white),
                        ),

                        SizedBox(width: 20, child: Center(child: Text('1'))),
                        TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: CupertinoColors.activeGreen,
                          ),
                          onPressed: () {},
                          child: Icon(Icons.add, color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
