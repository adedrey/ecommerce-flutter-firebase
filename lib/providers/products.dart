import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/const.dart';
import 'package:flutter/material.dart';

import '../models/product.dart';

class Products with ChangeNotifier {
  List<Product> _products = [];

  // Fetch Products
  Future<void> fetchProducts() async {
    final List<Product> loadedProducts = [];
    try {
      await firebaseFireStore.collection("products").get().then(
        (QuerySnapshot productSnapshot) {
          productSnapshot.docs.forEach((product) {
            loadedProducts.insert(
              0,
              Product(
                id: product.id,
                title: product.get("title"),
                description: product.get("description"),
                price: double.parse(product.get("price")),
                imageUrl: product.get("imageUrl"),
                productCategoryName: product.get("productCategoryName"),
                quantity: int.parse(product.get("quantity")),
              ),
            );
          });
        },
      );
      _products = loadedProducts;
      notifyListeners();
    } catch (err) {
      print(err);
    }
  }

  // Get all products
  List<Product> get products {
    return [..._products];
  }

  // Get product by category name
  List<Product> findByCategory(String productCategoryName) {
    return _products
        .where((product) => product.productCategoryName!
            .toLowerCase()
            .contains(productCategoryName.toLowerCase()))
        .toList();
  }

  // Get a product bu ID

  Product findById(String productId) {
    return _products.firstWhere((product) => product.id == productId);
  }
}

// final List<Product> _products = [
// Product(
//   id: "gucci-oversized",
//   title: "Gucci Oversized",
//   description: "Gucci is one of the best selling clothes in the universe",
//   price: 99.99,
//   imageUrl: "assets/images/arrival1.png",
//   productCategoryName: "Clothes",
//   quantity: 2,
// ),
// Product(
//   id: "t-shirt-oversized",
//   title: "T-shirt Oversized",
//   description: "T-shirt is one of the best selling clothes in the universe",
//   price: 59.99,
//   imageUrl: "assets/images/arrival2.png",
//   productCategoryName: "Clothes",
//   quantity: 2,
// ),
// Product(
//   id: "Nokia",
//   title: "Nokia 3310",
//   description: "This is the strongest phone ever.",
//   price: 59.99,
//   imageUrl: "assets/images/CatPhones.png",
//   productCategoryName: "Phones",
//   quantity: 2,
// )
// ];
