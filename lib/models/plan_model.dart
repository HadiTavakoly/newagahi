class Plan {
    Plan({
        this.code,
        this.data,
        this.meta,
        this.message,
        this.type,
    });

    int? code;
    List<Data>? data;
    List<dynamic>? meta;
    String? message;
    dynamic type;


    factory Plan.fromJson(Map<String, dynamic> json) => Plan(
        code: json["code"],
        data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
        meta: List<dynamic>.from(json["meta"].map((x) => x)),
        message: json["message"],
        type: json["type"],
    );

}

class Data {
    Data({
        this.id,
        this.planTitle,
        this.planDays,
        this.planPrice,
        this.planUpdateTimes,
        this.isSlider,
        this.isSideSlider,
        this.isText,
        this.isFree,
        this.hasLink,
        this.maxImgCount,
        this.maxKeywordCount,
        this.maxEditCount,
        this.planPriority,
        this.planStars,
        this.planPriorityText,
    });

    int? id;
    String? planTitle;
    int? planDays;
    int? planPrice;
    int? planUpdateTimes;
    int? isSlider;
    int? isSideSlider;
    int? isText;
    int? isFree;
    int? hasLink;
    int? maxImgCount;
    int? maxKeywordCount;
    int? maxEditCount;
    int? planPriority;
    int? planStars;
    String? planPriorityText;


    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["ID"],
        planTitle: json["PLAN_TITLE"],
        planDays: json["PLAN_DAYS"],
        planPrice: json["PLAN_PRICE"],
        planUpdateTimes: json["PLAN_UPDATE_TIMES"],
        isSlider: json["IS_SLIDER"],
        isSideSlider: json["IS_SIDE_SLIDER"],
        isText: json["IS_TEXT"],
        isFree: json["IS_FREE"],
        hasLink: json["HAS_LINK"],
        maxImgCount: json["MAX_IMG_COUNT"],
        maxKeywordCount: json["MAX_KEYWORD_COUNT"],
        maxEditCount: json["MAX_EDIT_COUNT"],
        planPriority: json["PLAN_PRIORITY"],
        planStars: json["PLAN_STARS"],
        planPriorityText: json["PLAN_PRIORITY_TEXT"],
    );

 
}
