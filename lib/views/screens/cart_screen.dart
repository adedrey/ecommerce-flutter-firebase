import 'package:ecommerce_app/providers/cart_provider.dart';
import 'package:ecommerce_app/providers/order_provider.dart';
import 'package:ecommerce_app/views/widgets/cart_empty.dart';
import 'package:ecommerce_app/views/widgets/cart_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../const.dart';

class CartScreen extends StatefulWidget {
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  bool _isLoading = false;

  // const CartScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _cartProvider = Provider.of<CartProvider>(context);
    final _orderProdvider = Provider.of<OrderProvider>(context, listen: false);
    return Scaffold(
      appBar: _cartProvider.getCartItems.isEmpty
          ? null
          : AppBar(
              centerTitle: true,
              foregroundColor: Colors.black,
              elevation: 1,
              title: Text(
                "Cart (${_cartProvider.getCartItems.length})",
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
              backgroundColor: textButtonColor,
              actions: [
                IconButton(
                  onPressed: () {
                    _cartProvider.clear();
                  },
                  icon: const Icon(
                    CupertinoIcons.trash,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
      body: _cartProvider.getCartItems.isEmpty
          ? CartEmpty()
          : ListView.builder(
              itemBuilder: (context, index) {
                return ChangeNotifierProvider.value(
                    value: _cartProvider.getCartItems.values.toList()[index],
                    child: CartItem(
                      productId: _cartProvider.getCartItems.values
                          .toList()[index]
                          .productId
                          .toString(),
                    ));
              },
              itemCount: _cartProvider.getCartItems.length,
            ),
      bottomSheet: _cartProvider.getCartItems.isEmpty
          ? null
          : Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () async {
                        setState(() {
                          _isLoading = true;
                        });
                        await _orderProdvider
                            .checkoutToOrders(_cartProvider.getCartItems);
                        setState(() {
                          _isLoading = false;
                        });
                        _cartProvider.clear();
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 15,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: _isLoading
                              ? [
                                  const CircularProgressIndicator(
                                    color: Colors.white,
                                  )
                                ]
                              : const [
                                  Text(
                                    "Checkout",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(
                                    Icons.shopping_cart_checkout,
                                    size: 18,
                                  )
                                ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    "Total",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "\$ ${_cartProvider.totalAmount.toStringAsFixed(2)}",
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
