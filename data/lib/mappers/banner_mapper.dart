import 'package:data/models/banner_model.dart';
import 'package:domain/entities/banner_entity.dart';

class BannerMapper {
  BannerEntity mapModelToEntity(BannerModel input) {
    return BannerEntity(title: input.title, description: input.description, image: input.image);
  }
}