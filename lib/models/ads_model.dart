class Ads {
  Ads({
    this.code,
    this.data,
    this.message,
  });

  int? code;
  List<Datum>? data;
  String? message;

  factory Ads.fromJson(Map<String, dynamic> json) => Ads(
        code: json["code"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        message: json["message"],
      );
}

class Datum {
  Datum({
    this.id,
    this.title,
    this.imageUrl,
    this.isSpecial,
    this.titleLimit,
    this.description,
    this.descriptionLimit,
    this.owner,
    this.price,
    this.link,
    this.views,
    this.category,
    this.state,
    this.city,
    this.updatedAt,
  });

  int? id;
  String? title;
  String? imageUrl;
  bool? isSpecial;
  String? titleLimit;
  String? description;
  String? descriptionLimit;
  Owner? owner;
  int? price;
  String? link;
  int? views;
  String? category;
  String? state;
  String? city;
  String? updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        title: json["title"],
        imageUrl: json["image_url"],
        isSpecial: json["is_special"],
        titleLimit: json["title_limit"],
        description: json["description"],
        descriptionLimit: json["description_limit"],
        owner: Owner.fromJson(json["owner"]),
        price: json["price"],
        link: json["link"] == null ? null : json["link"],
        views: json["views"],
        category: json["category"],
        state: json["state"],
        city: json["city"],
        updatedAt: json["updated_at"],
      );
}

class Owner {
  Owner({
    this.name,
    this.email,
    this.phone,
    this.address,
  });

  String? name;
  String? email;
  String? phone;
  String? address;

  factory Owner.fromJson(Map<String, dynamic> json) => Owner(
        name: json["name"] == null ? null : json["name"],
        email: json["email"],
        phone: json["phone"],
        address: json["address"] == null ? null : json["address"],
      );
}
