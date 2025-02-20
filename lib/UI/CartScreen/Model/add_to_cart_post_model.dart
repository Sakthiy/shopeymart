// To parse this JSON data, do
//
//     final addToCartPostModel = addToCartPostModelFromJson(jsonString);

import 'dart:convert';

AddToCartPostModel addToCartPostModelFromJson(String str) => AddToCartPostModel.fromJson(json.decode(str));

String addToCartPostModelToJson(AddToCartPostModel data) => json.encode(data.toJson());

class AddToCartPostModel {
  bool success;
  int count;
  Cart cart;
  String message;

  AddToCartPostModel({
    required this.success,
    required this.count,
    required this.cart,
    required this.message,
  });

  factory AddToCartPostModel.fromJson(Map<String, dynamic> json) => AddToCartPostModel(
    success: json["success"],
    count: json["count"],
    cart: Cart.fromJson(json["cart"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "count": count,
    "cart": cart.toJson(),
    "message": message,
  };
}

class Cart {
  List<Item> items;
  int totalAmount;

  Cart({
    required this.items,
    required this.totalAmount,
  });

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
    items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
    totalAmount: json["totalAmount"],
  );

  Map<String, dynamic> toJson() => {
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
    "totalAmount": totalAmount,
  };
}

class Item {
  String product;
  String variant;
  int quantity;

  Item({
    required this.product,
    required this.variant,
    required this.quantity,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    product: json["product"],
    variant: json["variant"],
    quantity: json["quantity"],
  );

  Map<String, dynamic> toJson() => {
    "product": product,
    "variant": variant,
    "quantity": quantity,
  };
}
