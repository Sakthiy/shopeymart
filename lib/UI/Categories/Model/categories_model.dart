// To parse this JSON data, do
//
//     final categoriesModel = categoriesModelFromJson(jsonString);

import 'dart:convert';

CategoriesModel categoriesModelFromJson(String str) => CategoriesModel.fromJson(json.decode(str));

String categoriesModelToJson(CategoriesModel data) => json.encode(data.toJson());

class CategoriesModel {
  bool success;
  int count;
  List<Datum> data;

  CategoriesModel({
    required this.success,
    required this.count,
    required this.data,
  });

  factory CategoriesModel.fromJson(Map<String, dynamic> json) => CategoriesModel(
    success: json["success"],
    count: json["count"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "count": count,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  String id;
  String categoryName;
  String image;
  bool homeDisplay;
  bool published;
  bool isActive;
  String date;

  Datum({
    required this.id,
    required this.categoryName,
    required this.image,
    required this.homeDisplay,
    required this.published,
    required this.isActive,
    required this.date,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    categoryName: json["category_name"],
    image: json["image"],
    homeDisplay: json["home_display"],
    published: json["published"],
    isActive: json["isActive"],
    date: json["date"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "category_name": categoryName,
    "image": image,
    "home_display": homeDisplay,
    "published": published,
    "isActive": isActive,
    "date": date,
  };
}
