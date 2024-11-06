import '../../domain/entities/medical_center_entity.dart';

class MedicalCenterModel extends MedicalCenter {
  MedicalCenterModel({
    required String image,
    required String title,
    required String locationName,
    required double reviewRate,
    required int countReviews,
    required double distanceKm,
    required int distanceMinutes,
  }) : super(
    image: image,
    title: title,
    locationName: locationName,
    reviewRate: reviewRate,
    countReviews: countReviews,
    distanceKm: distanceKm,
    distanceMinutes: distanceMinutes,
  );

  factory MedicalCenterModel.fromJson(Map<String, dynamic> json) {
    return MedicalCenterModel(
      image: json['image'],
      title: json['title'],
      locationName: json['location_name'],
      reviewRate: json['review_rate'],
      countReviews: json['count_reviews'],
      distanceKm: json['distance_km'],
      distanceMinutes: json['distance_minutes'],
    );
  }
}