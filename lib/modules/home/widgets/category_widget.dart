import 'package:flutter/material.dart';
import 'package:news_app/models/category_data_model.dart';

class CategoryWidget extends StatelessWidget {
  final CategoryData category;

  bool isRight;

  CategoryWidget({
    required this.category,
    required this.isRight,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 170,
        width: 145,
        decoration: BoxDecoration(
          color: category.color,
          borderRadius: BorderRadius.only(
            bottomRight: isRight ? Radius.zero : Radius.circular(20),
            topRight: Radius.circular(20),
            bottomLeft: isRight ? Radius.circular(20) : Radius.zero,
            topLeft: Radius.circular(20),
          ),
        ),
        child: Column(
          children: [
            Spacer(),
            Image.asset("assets/images/${category.image}"),
            const Spacer(),
            Text(
              category.title,
              style: const TextStyle(fontSize: 20),
            ),
            const Spacer()
          ],
        ),
      ),
    );
  }
}
