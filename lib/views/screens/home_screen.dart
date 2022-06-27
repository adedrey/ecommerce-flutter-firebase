import 'package:ecommerce_app/views/widgets/custom_appbar.dart';
import 'package:ecommerce_app/views/widgets/search_input.dart';
import 'package:ecommerce_app/views/widgets/tag_list.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        CustomAppBar(),
        SearchInput(),
        TagList(),
      ],
    ));
  }
}
