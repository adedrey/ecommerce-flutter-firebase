import 'package:flutter/material.dart';

import '../models/product.dart';

class Products with ChangeNotifier {
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

  // Get all products
  List<Product> get products {
    return [..._products];
  }

  // Get a product bu ID

  Product findById(String productId) {
    return _products.firstWhere((product) => product.id == productId);
  }
}
