// presentation/widgets/categories_section.dart
import 'dart:math';
import 'package:flutter/material.dart';
import '../../domain/entities/category_entity.dart';
import 'category_card.dart';

class CategoriesSection extends StatelessWidget {
  final List<Category> categories;

  CategoriesSection({required this.categories});

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
              backgroundColor: _getRandomColor(),
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
              backgroundColor: _getRandomColor(),
            );
          }).toList(),
        ),
      ],
    );
  }

  // Generate a random color for each category card
  Color _getRandomColor() {
    final Random random = Random();
    return Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
  }
}
