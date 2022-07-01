import 'package:badges/badges.dart';
import 'package:ecommerce_app/views/screens/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/product.dart';

class FeedsProduct extends StatefulWidget {
  @override
  State<FeedsProduct> createState() => _FeedsProductState();
}

class _FeedsProductState extends State<FeedsProduct> {
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 5,
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, DetailPage.routeName,
              arguments: product.id);
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Container(
                    height: 170,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                      image: DecorationImage(
                        image: NetworkImage(product.imageUrl.toString()),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 5,
                    top: 15,
                    child: Badge(
                      toAnimate: true,
                      shape: BadgeShape.square,
                      badgeColor: Colors.pink,
                      borderRadius: BorderRadius.circular(8),
                      badgeContent: const Text(
                        'New',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                product.title.toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  height: 1.6,
                ),
              ),
              Text(
                "\$ " + product.price.toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
