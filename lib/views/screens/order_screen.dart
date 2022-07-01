import 'package:ecommerce_app/providers/cart_provider.dart';
import 'package:ecommerce_app/providers/order_provider.dart';
import 'package:ecommerce_app/views/widgets/cart_empty.dart';
import 'package:ecommerce_app/views/widgets/cart_item.dart';
import 'package:ecommerce_app/views/widgets/order_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../const.dart';

class OrderScreen extends StatelessWidget {
  static const routeName = "/orders";
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _orderProvider = Provider.of<OrderProvider>(context);
    _orderProvider.fetchOrders();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        foregroundColor: Colors.black,
        elevation: 1,
        title: Text(
          "Order (${_orderProvider.getOrders.length})",
          style: const TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: textButtonColor,
      ),
      body: _orderProvider.getOrders.isEmpty
          ? Center(
              child: Text("You have no order."),
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return ChangeNotifierProvider.value(
                    value: _orderProvider.getOrders[index], child: OrderItem());
              },
              itemCount: _orderProvider.getOrders.length,
            ),
    );
  }
}
