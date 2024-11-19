import 'package:domain/entities/medical_center_entity.dart';
import 'package:flutter/material.dart';
import 'medical_center_card.dart';

class MedicalCentersSection extends StatelessWidget {
  final List<MedicalCenter> centers;

  MedicalCentersSection({required this.centers});

  @override
  Widget build(BuildContext context) {
    if (centers.isEmpty) {
      return Center(child: CircularProgressIndicator());
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Nearby Medical Centers',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text('See All', style: TextStyle(color: Colors.blue)),
          ],
        ),
        SizedBox(height: 16),
        SizedBox(
          height: 205, // Adjust height based on the card size
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: centers.length,
            itemBuilder: (context, index) {
              final center = centers[index];
              return Padding(
                padding: EdgeInsets.only(right: 5), // Add spacing between cards
                child: MedicalCenterCard(
                  title: center.title,
                  location: center.locationName,
                  rating: center.reviewRate,
                  distance: '${center.distanceKm} km',
                  time: '${center.distanceMinutes} min',
                  imagePath: center.image,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
