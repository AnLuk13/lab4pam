import '../../domain/entities/banner_entity.dart';
import '../../domain/repositories/banner_repository.dart';
import '../datasources/local_data_sources.dart';

class BannerRepositoryImpl implements BannerRepository {
  final LocalDataSource dataSource;

  BannerRepositoryImpl(this.dataSource);

  @override
  Future<List<BannerEntity>> fetchBanners() async {
    return await dataSource.fetchBanners();
  }
}