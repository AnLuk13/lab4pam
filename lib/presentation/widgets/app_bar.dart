import 'package:flutter/material.dart';

AppBar buildAppBar() {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    title: const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Location',
          style: TextStyle(
            color: Colors.grey, // Grey color for "Location" text
            fontSize: 12, // Slightly smaller font size for "Location"
          ),
        ),
        SizedBox(height: 4), // Add a bit of spacing
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.location_on, color: Colors.black),
            SizedBox(width: 8),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Seattle, USA',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w800,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            Icon(Icons.keyboard_arrow_down, color: Colors.black),
          ],
        ),
      ],
    ),
    actions: [
      Stack(
        children: [
          IconButton(
            icon: Icon(Icons.notifications_outlined, color: Colors.grey),
            onPressed: () {},
          ),
          Positioned(
            right: 11,
            top: 11,
            child: Container(
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
              constraints: const BoxConstraints(
                minWidth: 12,
                minHeight: 12,
              ),
            ),
          )
        ],
      ),
    ],
  );
}
