import 'package:data/models/doctor_model.dart';
import 'package:domain/entities/doctor_entity.dart';

class DoctorMapper {
  Doctor mapModelToEntity(DoctorModel input) {
    return Doctor(image: input.image, fullName: input.fullName, typeOfDoctor: input.typeOfDoctor, locationOfCenter: input.locationOfCenter, reviewRate: input.reviewRate, reviewsCount: input.reviewsCount);
  }
}