import '../entities/doctor_entity.dart';
import '../repositories/doctor_repository.dart';

class GetDoctors {
  final DoctorRepository repository;

  GetDoctors(this.repository);

  Future<List<Doctor>> call() async {
    return await repository.fetchDoctors();
  }
}