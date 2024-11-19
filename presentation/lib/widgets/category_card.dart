// presentation/widgets/category_card.dart
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String title;
  final String iconPath;
  final Color backgroundColor;

  CategoryCard({
    required this.title,
    required this.iconPath,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    // Truncate the title if it is longer than 7 characters
    String truncatedTitle = title.length > 7 ? '${title.substring(0, 7)}...' : title;

    // Check if the iconPath is a network image or a local asset
    bool isNetworkImage = iconPath.startsWith('http') || iconPath.startsWith('https');

    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: isNetworkImage
              ? Image.network(
            iconPath,
            height: 30,
            width: 30,
            errorBuilder: (context, error, stackTrace) {
              return Icon(Icons.error, size: 30, color: Colors.red);
            },
          )
              : Image.asset(
            iconPath,
            height: 30,
            width: 30,
          ),
        ),
        SizedBox(height: 8),
        Text(
          truncatedTitle,
          style: TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}
