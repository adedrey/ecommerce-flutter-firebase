import 'package:ecommerce_app/models/cart_attr.dart';
import 'package:ecommerce_app/providers/cart_provider.dart';
import 'package:ecommerce_app/views/screens/detail_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartItem extends StatelessWidget {
  final String productId;

  const CartItem({Key? key, required this.productId}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _cartAttr = Provider.of<CartAttr>(context);
    final _cartProvider = Provider.of<CartProvider>(context);
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, DetailPage.routeName,
            arguments: productId);
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
                  image: AssetImage(
                    _cartAttr.imageUrl!,
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
                        _cartAttr.title!,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          _cartProvider.removeItem(productId);
                        },
                        icon: const Icon(
                          CupertinoIcons.delete_left,
                          color: Colors.red,
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
                        _cartAttr.price!.toString(),
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
                        "Subtotal",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "${(_cartAttr.price! * _cartAttr.quantity!).toStringAsFixed(2)}",
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
                          _cartProvider.removeSingleCartItem(productId);
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
                              "${_cartAttr.quantity!}",
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          _cartProvider.addProductToCart(
                            productId,
                            _cartAttr.price!,
                            _cartAttr.title!,
                            _cartAttr.imageUrl!,
                          );
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
