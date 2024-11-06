import '../../domain/entities/doctor_entity.dart';
import '../../domain/repositories/doctor_repository.dart';
import '../datasources/local_data_sources.dart';

class DoctorRepositoryImpl implements DoctorRepository {
  final LocalDataSource dataSource;

  DoctorRepositoryImpl(this.dataSource);

  @override
  Future<List<Doctor>> fetchDoctors() async {
    return await dataSource.fetchDoctors();
  }
}