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



// import 'dart:convert';

// class Category {
//     Category({
//         this.code,
//         this.data,
//         this.meta,
//         this.message,
//         this.type,
//     });

//     int? code;
//     List<Datum>? data;
//     List<dynamic>? meta;
//     String? message;
//     dynamic? type;

//     factory Category.fromRawJson(String str) => Category.fromJson(json.decode(str));

//     String toRawJson() => json.encode(toJson());

//     factory Category.fromJson(Map<String, dynamic> json) => Category(
//         code: json["code"],
//         data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
//         meta: List<dynamic>.from(json["meta"].map((x) => x)),
//         message: json["message"],
//         type: json["type"],
//     );

//     Map<String, dynamic> toJson() => {
//         "code": code,
//         "data": List<dynamic>.from(data!.map((x) => x.toJson())),
//         "meta": List<dynamic>.from(meta!.map((x) => x)),
//         "message": message,
//         "type": type,
//     };
// }

// class Datum {
//     Datum({
//         this.id,
//         this.name,
//         this.icon,
//         this.isFree,
//         this.adsCount,
//     });

//     int? id;
//     String? name;
//     String? icon;
//     String? isFree;
//     int? adsCount;

//     factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

//     String toRawJson() => json.encode(toJson());

//     factory Datum.fromJson(Map<String, dynamic> json) => Datum(
//         id: json["id"],
//         name: json["name"],
//         icon: json["icon"],
//         isFree: json["is_free"],
//         adsCount: json["ads_count"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "icon": icon,
//         "is_free": isFree,
//         "ads_count": adsCount,
//     };
// }

