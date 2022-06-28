import 'package:ecommerce_app/models/product.dart';
import 'package:ecommerce_app/views/widgets/products.dart';
import 'package:flutter/material.dart';

class AllProducts extends StatelessWidget {
  final productsList = Product.generateProducts();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            height: 250,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => ProductItem(
                product: productsList[index],
              ),
              itemCount: productsList.length,
              separatorBuilder: (_, index) => const SizedBox(
                width: 5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
