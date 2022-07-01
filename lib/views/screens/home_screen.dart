import 'package:ecommerce_app/providers/products.dart';
import 'package:ecommerce_app/views/widgets/category.dart';
import 'package:ecommerce_app/views/widgets/tag_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../views/widgets/all_products.dart';
import '../../views/widgets/category_list.dart';
import '../../views/widgets/custom_appbar.dart';
import '../../views/widgets/search_input.dart';
import '../../models/product.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _productProvider =
        Provider.of<Products>(context, listen: false).fetchProducts();

    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(),
          SearchInput(),
          TagList(),
          Category(),
          CategoryList(),
          AllProducts(),
        ],
      ),
    ));
  }
}
