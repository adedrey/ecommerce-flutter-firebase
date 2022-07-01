import 'package:ecommerce_app/models/cart_attr.dart';
import 'package:ecommerce_app/providers/cart_provider.dart';
import 'package:ecommerce_app/views/screens/detail_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/order_attr.dart';
import '../../providers/order_provider.dart';

class OrderItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _orderAttr = Provider.of<OrderAttr>(context);
    final _orderProvider = Provider.of<OrderProvider>(context);
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, DetailPage.routeName,
            arguments: _orderAttr.productId);
      },
      child: Container(
        height: 160,
        margin: const EdgeInsets.only(
          right: 5,
          top: 10,
          bottom: 10,
          left: 10,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white70,
        ),
        child: Row(
          children: [
            Container(
              width: 130,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    _orderAttr.imageUrl,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _orderAttr.title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      IconButton(
                        onPressed: () async {
                          await _orderProvider
                              .deleteOrderById(_orderAttr.orderId);
                        },
                        icon: const Icon(
                          CupertinoIcons.delete_left,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        "Price",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        _orderAttr.price.toString(),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const Text(
                        "Order 1",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "100",
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.pink,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const Text(
                        "Ship Fee",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      IconButton(
                        onPressed: () {
                          // Remove
                        },
                        icon: const Icon(
                          CupertinoIcons.minus_rectangle,
                        ),
                      ),
                      Card(
                        elevation: 5,
                        child: Container(
                          width: 50,
                          height: 20,
                          decoration: const BoxDecoration(
                            color: Colors.pink,
                          ),
                          child: Center(
                            child: Text(
                              "${_orderAttr.quantity}",
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          // ADD
                        },
                        icon: const Icon(
                          CupertinoIcons.add,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }
}
