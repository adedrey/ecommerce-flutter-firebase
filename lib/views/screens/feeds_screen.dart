import 'package:ecommerce_app/const.dart';
import 'package:ecommerce_app/views/widgets/feeds_products.dart';
import 'package:flutter/material.dart';

import '../../models/product.dart';

class FeedsScreen extends StatelessWidget {
  List<Product> _products = [
    Product(
      id: "gucci-oversized",
      title: "Gucci Oversized",
      description: "Gucci is one of the best selling clothes in the universe",
      price: 99.99,
      imageUrl: "assets/images/arrival1.png",
      productCategoryName: "Clothes",
      quantity: 2,
    ),
    Product(
      id: "t-shirt-oversized",
      title: "T-shirt Oversized",
      description: "T-shirt is one of the best selling clothes in the universe",
      price: 59.99,
      imageUrl: "assets/images/arrival2.png",
      productCategoryName: "Clothes",
      quantity: 2,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: textButtonColor,
        centerTitle: true,
        elevation: 0,
        title: const Text(
          "Feeds Products",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        childAspectRatio: 240 / 300, // Width / Height - From the Product widget
        children: List.generate(
          _products.length,
          (index) => FeedsProduct(product: _products[index]),
        ),
      ),
    );
  }
}
