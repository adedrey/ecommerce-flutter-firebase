import 'package:ecommerce_app/models/cart_attr.dart';
import 'package:ecommerce_app/views/widgets/cart_item.dart';
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

  // Add to Cart
  void addProductToCart(
    String productId,
    double price,
    String title,
    String imageUrl,
  ) {
    // Check if the product already exist in the cart
    if (_cartItems.containsKey(productId)) {
      _cartItems.update(
        productId,
        (existingCartItem) {
          // Update the quantity and amount
          return CartAttr(
            id: existingCartItem.id,
            title: existingCartItem.title,
            price: existingCartItem.price,
            imageUrl: existingCartItem.imageUrl,
            quantity: existingCartItem.quantity! + 1,
            productId: existingCartItem.productId,
          );
        },
      );
    } else {
      _cartItems.putIfAbsent(
        productId,
        () => CartAttr(
          id: DateTime.now().toString(),
          productId: productId,
          title: title,
          price: price,
          imageUrl: imageUrl,
          quantity: 1,
        ),
      );
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    _cartItems.remove(productId);
    notifyListeners();
  }

  // Deduct Item from Cart
  void removeSingleCartItem(String productId) {
    if (!_cartItems.containsKey(productId)) {
      return;
    }
    if (_cartItems[productId]!.quantity! > 1) {
      _cartItems.update(
        productId,
        (existingCartItem) => CartAttr(
          id: existingCartItem.id,
          productId: existingCartItem.productId,
          title: existingCartItem.title,
          price: existingCartItem.price,
          imageUrl: existingCartItem.imageUrl,
          quantity: existingCartItem.quantity! - 1,
        ),
      );
    } else {
      _cartItems.remove(productId);
    }
    notifyListeners();
  }

  void clear() {
    _cartItems = {};
    notifyListeners();
  }
}
