import 'package:flutter/material.dart';

class Product with ChangeNotifier {
  String? id;
  String? title;
  String? description;
  double? price;
  String? imageUrl;
  String? productCategoryName;
  int? quantity;

  Product({
    this.id,
    this.title,
    this.description,
    this.price,
    this.imageUrl,
    this.productCategoryName,
    this.quantity,
  });
}
