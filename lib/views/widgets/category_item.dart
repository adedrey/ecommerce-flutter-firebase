import 'package:ecommerce_app/views/screens/feeds_category.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final int categoryIndex;
  CategoryItem({required this.categoryIndex});
  List<Map<String, Object>> categories = [
    {'categoryName': 'Phones', 'categoryImage': 'assets/images/CatPhones.png'},
    {
      'categoryName': 'Clothes',
      'categoryImage': 'assets/images/CatClothes.jpg'
    },
    {'categoryName': 'Laptop', 'categoryImage': 'assets/images/CatLaptops.png'},
    {'categoryName': 'Shoes', 'categoryImage': 'assets/images/CatShoes.jpg'},
    {'categoryName': 'Watches', 'categoryImage': 'assets/images/CatWatches.jpg'}
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              FeedsCategoryScreen.routeName,
              arguments: '${categories[categoryIndex]['categoryName']}',
            );
          },
          child: Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image:
                    AssetImage('${categories[categoryIndex]['categoryImage']}'),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 10,
          right: 10,
          child: Container(
            child: Text(
              '${categories[categoryIndex]['categoryName']}',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        )
      ],
    );
  }
}
