import 'package:ecommerce_app/views/widgets/category_list.dart';
import 'package:flutter/material.dart';

import './category_item.dart';

class Category extends StatelessWidget {
  const Category({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 180,
        width: double.infinity,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, index) => CategoryItem(
            categoryIndex: index,
          ),
        ));
  }
}
