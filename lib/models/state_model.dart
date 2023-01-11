class State {
  State({
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
  dynamic? type;

  factory State.fromJson(Map<String, dynamic> json) => State(
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
    this.stateName,
    this.slug,
  });

  int? id;
  String? stateName;
  String? slug;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["ID"],
        stateName: json["STATE_NAME"],
        slug: json["SLUG"],
      );
}
