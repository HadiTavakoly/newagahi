class City {
  City({
    this.code,
    this.data,
    this.meta,
    this.message,
    this.type,
  });

  int? code;
  List<Datum>? data;
  List<dynamic>? meta;
  String? message;
  dynamic type;

  factory City.fromJson(Map<String, dynamic> json) => City(
        code: json["code"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        meta: List<dynamic>.from(json["meta"].map((x) => x)),
        message: json["message"],
        type: json["type"],
      );
}

class Datum {
  Datum({
    this.id,
    this.cityName,
    this.slug,
    this.stateId,
  });

  int? id;
  String? cityName;
  String? slug;
  int? stateId;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["ID"],
        cityName: json["CITY_NAME"],
        slug: json["SLUG"],
        stateId: json["STATE_ID"],
      );
}
