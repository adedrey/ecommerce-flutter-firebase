import 'package:ecommerce_app/models/cart_attr.dart';
import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  Map<String, CartAttr> _cartItems = {};

  // Get all Products in the Cart
  Map<String, CartAttr> get getCartItems {
    return {..._cartItems};
  }

  // Calculat total Price in the Cart
  double get totalAmount {
    double total = 0.0;
    _cartItems.forEach(
      (key, cartItem) {
        total += cartItem.price! * cartItem.quantity!;
      },
    );
    return total;
  }
}
