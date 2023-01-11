class Register {
  Register({
    this.code,
    this.data,
    // this.meta,
    this.message,
    // this.type,
  });

  int? code;
  List<Data>? data;
  // List<dynamic>? meta;
  String? message;
  // dynamic type;

  factory Register.fromJson(json) => Register(
        code: json["code"],
        data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
        // data: Data.fromJson(json["data"]),
        //  Data.fromJson(json["data"]),
        // meta: List<dynamic>.from(json["meta"].map((x) => x)),
        message: json["message"],
        // type: json["type"],
      );
}

class Data {
  Data({
    this.link,
  });

  String? link;

  factory Data.fromJson(json) => Data(
        link: json["link"],
      );
}
