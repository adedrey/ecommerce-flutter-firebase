import 'package:flutter/material.dart';

class TagList extends StatelessWidget {
  final tagList = [
    "Woman",
    "T-shirt",
    "Dress",
  ];
  TagList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: tagList
          .map(
            (element) => Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white54,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Text(
                element,
                style: const TextStyle(
                  color: Colors.black54,
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
