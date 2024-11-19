import '../entities/banner_entity.dart';
import '../repositories/banner_repository.dart';


class GetBanners {
  final BannerRepository repository;

  GetBanners(this.repository);

  Future<List<BannerEntity>> call() async {
    return await repository.fetchBanners();
  }
}