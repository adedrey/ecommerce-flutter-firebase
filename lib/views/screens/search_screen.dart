import 'package:ecommerce_app/const.dart';
import 'package:ecommerce_app/models/product.dart';
import 'package:ecommerce_app/providers/products.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/feeds_products.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchEditingContoller =
      TextEditingController(text: "");
  List<Product> _searchedProducts = [];

  @override
  Widget build(BuildContext context) {
    final _productsDataFromProvider = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: textButtonColor,
        elevation: .3,
        title: TextField(
          controller: _searchEditingContoller,
          onChanged: (value) {
            _searchEditingContoller.text.toLowerCase();
            setState(() {
              _searchedProducts = _productsDataFromProvider
                  .searchProducts(_searchEditingContoller.text);
            });
          },
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            hintText: "Search for Products",
            hintStyle: TextStyle(
              color: Colors.grey,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none,
            ),
            prefixIcon: Container(
              padding: const EdgeInsets.all(15),
              child: Image.asset(
                "assets/icons/search.png",
                width: 15,
              ),
            ),
            suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    _searchEditingContoller.clear();
                    _searchedProducts = [];
                  });
                },
                child: const Icon(Icons.clear)),
          ),
        ),
      ),
      body: _searchedProducts.length > 0
          ? GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              childAspectRatio:
                  240 / 300, // Width / Height - From the Product widget
              children: List.generate(
                _searchedProducts.length,
                (index) => ChangeNotifierProvider.value(
                  child: FeedsProduct(),
                  value: _searchedProducts[index],
                ),
              ),
            )
          : const Center(
              child: Text(
              "Search for Products",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54),
            )),
    );
  }
}
