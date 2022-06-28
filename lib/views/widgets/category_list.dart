import 'package:ecommerce_app/const.dart';
import 'package:flutter/material.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "New Arrival",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: [
              const Text(
                "View All",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: textButtonColor,
                    size: 22,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
