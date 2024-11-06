import '../repositories/doctor_repository.dart';
import '../entities/doctor_entity.dart';


class GetDoctors {
  final DoctorRepository repository;

  GetDoctors(this.repository);

  Future<List<Doctor>> call() async {
    return await repository.fetchDoctors();
  }
}