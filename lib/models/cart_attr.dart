import 'package:flutter/material.dart';

class CartAttr with ChangeNotifier {
  String? id;
  String? title;
  double? price;
  String? imageUrl;
  String? productId;
  int? quantity;

  CartAttr({
    this.id,
    this.title,
    this.price,
    this.imageUrl,
    this.productId,
    this.quantity,
  });
}
