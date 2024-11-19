import 'package:domain/entities/category_entity.dart';
import 'package:flutter/material.dart';
import 'category_card.dart';

class CategoriesSection extends StatelessWidget {
  final List<Category> categories;

  CategoriesSection({required this.categories});

  // Define a list of six basic colors
  final List<Color> basicColors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.orange,
    Colors.purple,
    Colors.yellow,
  ];

  @override
  Widget build(BuildContext context) {
    if (categories.isEmpty) {
      return Center(child: CircularProgressIndicator());
    }

    int mid = (categories.length / 2).ceil();
    var firstRow = categories.sublist(0, mid);
    var secondRow = categories.sublist(mid);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Categories', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            Text('See All', style: TextStyle(color: Colors.blue)),
          ],
        ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: firstRow.map((category) {
            return CategoryCard(
              title: category.title,
              iconPath: category.icon,
              backgroundColor: _getColorForIndex(categories.indexOf(category)),
            );
          }).toList(),
        ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: secondRow.map((category) {
            return CategoryCard(
              title: category.title,
              iconPath: category.icon,
              backgroundColor: _getColorForIndex(categories.indexOf(category)),
            );
          }).toList(),
        ),
      ],
    );
  }

  // Cycle through the basic colors based on the category index
  Color _getColorForIndex(int index) {
    return basicColors[index % basicColors.length];
  }
}
