import 'package:data/models/medical_center_model.dart';
import 'package:domain/entities/doctor_entity.dart';
import 'package:domain/entities/medical_center_entity.dart';

class MedicalCenterMapper {
  MedicalCenter mapModelToEntity(MedicalCenterModel input) {
    return MedicalCenter(image: input.image, title: input.title, locationName: input.locationName, reviewRate: input.reviewRate, countReviews: input.countReviews, distanceKm: input.distanceKm, distanceMinutes: input.distanceMinutes);
  }
}
