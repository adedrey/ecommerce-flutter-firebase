import 'package:ecommerce_app/const.dart';
import 'package:ecommerce_app/providers/products.dart';
import 'package:ecommerce_app/views/widgets/feeds_products.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/product.dart';

class FeedsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<Products>(context);
    final List<Product> products = productProvider.products;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: textButtonColor,
        centerTitle: true,
        elevation: 0,
        title: const Text(
          "Feeds Products",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        childAspectRatio: 240 / 300, // Width / Height - From the Product widget
        children: List.generate(
          products.length,
          (index) => ChangeNotifierProvider.value(
            child: FeedsProduct(),
            value: products[index],
          ),
        ),
      ),
    );
  }
}
