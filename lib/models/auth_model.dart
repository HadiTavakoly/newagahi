class Auth {
  Auth({
    this.code,
    this.data,
    this.message,
    this.type,
  });

  int? code;
  List<Datum>? data;
  String? message;
  dynamic type;

  factory Auth.fromJson(Map<String, dynamic> json) => Auth(
        code: json["code"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        message: json["message"],
        type: json["type"],
      );
}

class Datum {
  Datum({
    this.id,
    this.username,
    this.name,
    this.tel,
    this.email,
    this.apiToken,
    this.createdAt,this.link,
  });

  int? id;
  String? username;
  String? name;
  String? tel;
  String? email;
  String? apiToken;
  String? createdAt;
  String? link;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        username: json["username"],
        name: json["name"],
        tel: json["tel"],
        email: json["email"],
        apiToken: json["api_token"],
        createdAt: json["created_at"],
        link: json['link']
      );
}
