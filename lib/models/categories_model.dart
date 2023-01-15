class Category {
  int? code;
  List<CategoryData>? data;
  String? message;

  Category({
    this.code,
    this.data,
    this.message,
  });

  factory Category.fromJson(json) {
    return Category(
      code: json['code'],
      data: List<CategoryData>.from(
        json['data'].map(
          (x) => CategoryData.fromJson(x),
        ),
      ),
      message: json['message'],
    );
  }
}

class CategoryData {
  int? id;
  String? name;
  String? icon;
  int? adsCount;

  CategoryData({
    this.id,
    this.name,
    this.icon,
    this.adsCount,
  });

  factory CategoryData.fromJson(json) {
    return CategoryData(
      id: json['id'],
      name: json['name'],
      icon: json['icon'],
      adsCount: json['adsCount'],
    );
  }
}



