import 'package:data/models/category_model.dart';
import 'package:domain/entities/category_entity.dart';

class CategoryMapper {
  Category mapModelToEntity(CategoryModel input) {
    return Category(title: input.title, icon: input.icon);
  }
}