import 'package:ecommerce_app/views/widgets/products.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/products.dart';

class AllProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context).products;
    return Container(
      child: Column(
        children: [
          Container(
            height: 250,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => ProductItem(
                product: products[index],
              ),
              itemCount: products.length,
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
