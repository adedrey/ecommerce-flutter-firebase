import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/const.dart';
import 'package:ecommerce_app/models/cart_attr.dart';
import 'package:ecommerce_app/views/widgets/order_item.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../models/order_attr.dart';

class OrderProvider with ChangeNotifier {
  List<OrderAttr> _orders = [];

  // Fetch Orders
  Future<void> fetchOrders() async {
    final List<OrderAttr> loadedOrders = [];
    try {
      await firebaseFireStore
          .collection("orders")
          .where("userId", isEqualTo: firebaseAuth.currentUser!.uid)
          .get()
          .then(
        (QuerySnapshot ordersnapshot) {
          ordersnapshot.docs.forEach((order) {
            loadedOrders.insert(
              0,
              OrderAttr(
                  orderId: order.id.toString(),
                  title: order.get("title").toString(),
                  price: double.parse(order.get("price").toString()),
                  imageUrl: order.get("imageUrl").toString(),
                  userId: order.get("userId").toString(),
                  productId: order.get("productId").toString(),
                  quantity: int.parse(order.get("quantity").toString()),
                  dateTime: order.get("dateTime").toString()),
            );
          });
        },
      );
      _orders = loadedOrders;
      notifyListeners();
    } catch (err) {
      print(err);
    }
  }

  // Checkout

  Future<void> checkoutToOrders(Map<String, CartAttr> cartItems) async {
    var uuid = Uuid();
    try {
      cartItems.forEach(
        (key, value) async {
          var orderId = uuid.v4();
          await firebaseFireStore.collection("orders").doc(orderId).set({
            "orderId": orderId.toString(),
            "userId": firebaseAuth.currentUser!.uid,
            "productId": value.productId.toString(),
            "title": value.title.toString(),
            "price": value.price.toString(),
            "imageUrl": value.imageUrl.toString(),
            "quantity": value.quantity.toString(),
            "dateTime": Timestamp.now(),
          });
        },
      );
      await fetchOrders();
    } catch (err) {
      //
    }
  }

  // Get all Orders
  List<OrderAttr> get getOrders {
    return [..._orders];
  }

  // Get a OrderItem bu ID

  Future<void> deleteOrderById(String orderItemId) async {
    await firebaseFireStore.collection("orders").doc(orderItemId).delete();
  }
}
