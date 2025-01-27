// To parse this JSON data, do
//
//     final favoriteModel = favoriteModelFromJson(jsonString);

import 'dart:convert';

FavoriteModel favoriteModelFromJson(String str) => FavoriteModel.fromJson(json.decode(str));

String favoriteModelToJson(FavoriteModel data) => json.encode(data.toJson());

class FavoriteModel {
    bool success;
    int count;
    Wishlist wishlist;
    String message;

    FavoriteModel({
        required this.success,
        required this.count,
        required this.wishlist,
        required this.message,
    });

    factory FavoriteModel.fromJson(Map<String, dynamic> json) => FavoriteModel(
        success: json["success"],
        count: json["count"],
        wishlist: Wishlist.fromJson(json["wishlist"]),
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "count": count,
        "wishlist": wishlist.toJson(),
        "message": message,
    };
}

class Wishlist {
    String id;
    String user;
    List<String> products;
    String createdAt;
    String updatedAt;

    Wishlist({
        required this.id,
        required this.user,
        required this.products,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Wishlist.fromJson(Map<String, dynamic> json) => Wishlist(
        id: json["_id"],
        user: json["user"],
        products: List<String>.from(json["products"].map((x) => x)),
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "user": user,
        "products": List<dynamic>.from(products.map((x) => x)),
        "createdAt": createdAt,
        "updatedAt": updatedAt,
    };
}
