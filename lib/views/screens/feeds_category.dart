import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../const.dart';
import '../../models/product.dart';
import '../../providers/products.dart';
import '../widgets/feeds_products.dart';

class FeedsCategoryScreen extends StatelessWidget {
  static const routeName = "/feeds-category";
  const FeedsCategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String categoryName =
        ModalRoute.of(context)!.settings.arguments as String;
    final productProvider = Provider.of<Products>(context);
    final List<Product> products = productProvider.findByCategory(categoryName);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: textButtonColor,
        foregroundColor: Colors.black,
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
