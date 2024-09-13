import 'package:flutter/material.dart';
import '../../../models/category_data_model.dart';
import '../widgets/category_widget.dart';

class CategoryScreen extends StatelessWidget {
  void Function(CategoryData) onTap;

  CategoryScreen({
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(
            height: h * 0.015,
          ),
          Row(
            children: [
              SizedBox(
                width: w * 0.08,
              ),
              const Text(
                "Pick your category \n of interest",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          SizedBox(
            height: h * 0.015,
          ),
          Expanded(
            child: GridView.builder(
              itemCount: CategoryData.category.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 140 / 160, crossAxisCount: 2),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    onTap(CategoryData.category[index]);
                  },
                  child: CategoryWidget(
                    category: CategoryData.category[index],
                    isRight: index % 2 == 0,
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
