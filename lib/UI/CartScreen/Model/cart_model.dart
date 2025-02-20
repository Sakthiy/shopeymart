// To parse this JSON data, do
//
//     final cartModel = cartModelFromJson(jsonString);

import 'dart:convert';

CartModel cartModelFromJson(String str) => CartModel.fromJson(json.decode(str));

String cartModelToJson(CartModel data) => json.encode(data.toJson());

class CartModel {
  bool? success;
  int? count;
  Cart cart;
  String message;

  CartModel({
    this.success,
    this.count,
    required this.cart,
    required this.message,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        success: json["success"] ?? false,
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
  Product product;
  Variant variant;
  int? price;
  int sellingPrice;
  int quantity;
  int itemTotal;

  Item({
    required this.product,
    required this.variant,
    this.price,
    required this.sellingPrice,
    required this.quantity,
    required this.itemTotal,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        product: Product.fromJson(json["product"]),
        variant: Variant.fromJson(json["variant"]),
        price: json["price"],
        sellingPrice: json["selling_price"],
        quantity: json["quantity"],
        itemTotal: json["itemTotal"],
      );

  Map<String, dynamic> toJson() => {
        "product": product.toJson(),
        "variant": variant.toJson(),
        "price": price,
        "selling_price": sellingPrice,
        "quantity": quantity,
        "itemTotal": itemTotal,
      };
}

class Product {
  String productId;
  String productName;
  String productShortDec;
  String thumbnail;

  Product({
    required this.productId,
    required this.productName,
    required this.productShortDec,
    required this.thumbnail,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        productId: json["productId"],
        productName: json["product_name"],
        productShortDec: json["product_short_dec"],
        thumbnail: json["thumbnail"],
      );

  Map<String, dynamic> toJson() => {
        "productId": productId,
        "product_name": productName,
        "product_short_dec": productShortDec,
        "thumbnail": thumbnail,
      };
}

class Variant {
  String variantId;
  String variantImage;

  Variant({
    required this.variantId,
    required this.variantImage,
  });

  factory Variant.fromJson(Map<String, dynamic> json) => Variant(
        variantId: json["variantId"],
        variantImage: json["variantImage"],
      );

  Map<String, dynamic> toJson() => {
        "variantId": variantId,
        "variantImage": variantImage,
      };
}
