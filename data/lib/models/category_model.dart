class CategoryModel{
  final String title;
  final String icon;

  CategoryModel({
    required this.title,
    required this.icon,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      title: json['title'],
      icon: json['icon'],
    );
  }
}