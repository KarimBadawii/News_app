import 'package:flutter/material.dart';

class CategoryData {
  String id;
  String title;
  String image;
  Color color;

  CategoryData(
      {required this.id,
      required this.title,
      required this.image,
      required this.color});

  static List<CategoryData> category = [
    CategoryData(
        id: "sports", title: "Sports", image: "sports.png", color: Colors.red),
    CategoryData(
        id: "politics",
        title: "Politics",
        image: "Politics.png",
        color: Colors.blue),
    CategoryData(
        id: "health", title: "Health", image: "health.png", color: Colors.pink),
    CategoryData(
        id: "business",
        title: "Business",
        image: "bussines.png",
        color: Colors.brown),
    CategoryData(
        id: "entertainment",
        title: "Entertainment",
        image: "environment.png",
        color: Colors.indigoAccent),
    CategoryData(
        id: "science",
        title: "Science",
        image: "science.png",
        color: Colors.amberAccent),
  ];
}
