// To parse this JSON data, do
//
//     final subcategoryModel = subcategoryModelFromJson(jsonString);

import 'dart:convert';

SubcategoryModel subcategoryModelFromJson(String str) => SubcategoryModel.fromJson(json.decode(str));

String subcategoryModelToJson(SubcategoryModel data) => json.encode(data.toJson());

class SubcategoryModel {
    bool success;
    int count;
    List<Datum> data;

    SubcategoryModel({
        required this.success,
        required this.count,
        required this.data,
    });

    factory SubcategoryModel.fromJson(Map<String, dynamic> json) => SubcategoryModel(
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
    String subcategoryName;
    ParentCategory parentCategory;
    bool homeDisplay;
    bool published;
    bool isActive;
    String images;
    String date;

    Datum({
        required this.id,
        required this.subcategoryName,
        required this.parentCategory,
        required this.homeDisplay,
        required this.published,
        required this.isActive,
        required this.images,
        required this.date,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        subcategoryName: json["subcategory_name"],
        parentCategory: ParentCategory.fromJson(json["parentCategory"]),
        homeDisplay: json["home_display"],
        published: json["published"],
        isActive: json["isActive"],
        images: json["images"],
        date: json["date"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "subcategory_name": subcategoryName,
        "parentCategory": parentCategory.toJson(),
        "home_display": homeDisplay,
        "published": published,
        "isActive": isActive,
        "images": images,
        "date": date,
    };
}

class ParentCategory {
    String id;
    String categoryName;

    ParentCategory({
        required this.id,
        required this.categoryName,
    });

    factory ParentCategory.fromJson(Map<String, dynamic> json) => ParentCategory(
        id: json["id"],
        categoryName: json["category_name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "category_name": categoryName,
    };
}
