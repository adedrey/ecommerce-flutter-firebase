import 'package:ecommerce_app/models/product.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final Product product;
  DetailPage({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 500,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      product.imageUrl.toString(),
                    ),
                    fit: BoxFit.fitHeight,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Positioned(
                left: 15,
                top: 30,
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.9),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 25,
              vertical: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  product.productName.toString(),
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  child: const Icon(
                    Icons.favorite,
                    color: Colors.red,
                    size: 15,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
