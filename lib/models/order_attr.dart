import 'package:ecommerce_app/models/cart_attr.dart';
import 'package:flutter/material.dart';

class OrderAttr with ChangeNotifier {
  final String orderId;
  final String userId;
  final String productId;
  final String title;
  final double price;
  final String imageUrl;
  final int quantity;
  final String dateTime;

  OrderAttr({
    required this.orderId,
    required this.userId,
    required this.productId,
    required this.title,
    required this.price,
    required this.imageUrl,
    required this.quantity,
    required this.dateTime,
  });
}
