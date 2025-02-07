// To parse this JSON data, do
//
//     final favoriteProductsModel = favoriteProductsModelFromJson(jsonString);

import 'dart:convert';

FavoriteProductsModel favoriteProductsModelFromJson(String str) =>
    FavoriteProductsModel.fromJson(json.decode(str));

String favoriteProductsModelToJson(FavoriteProductsModel data) =>
    json.encode(data.toJson());

class FavoriteProductsModel {
  bool success;
  int? count;
  List<Wishlist> wishlist;
  String message;

  FavoriteProductsModel({
    required this.success,
    this.count,
    required this.wishlist,
    required this.message,
  });

  factory FavoriteProductsModel.fromJson(Map<String, dynamic> json) =>
      FavoriteProductsModel(
        success: json["success"],
        count: json["count"],
        wishlist: List<Wishlist>.from(
            json["wishlist"].map((x) => Wishlist.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "count": count,
        "wishlist": List<dynamic>.from(wishlist.map((x) => x.toJson())),
        "message": message,
      };
}

class Wishlist {
  String id;
  String productName;
  String fkCategory;
  dynamic fkSubcategory;
  dynamic fkBrand;
  List<dynamic> tags;
  String productShortDesc;
  String productLongDesc;
  String specification;
  String productThumbnailName;
  String productThumbnailPath;
  List<ProductDescImage> productDescImages;
  String videoProvider;
  String videoUrl;
  String offerStartDate;
  String offerEndDate;
  String offerDiscountType;
  int offerDiscount;
  String flashSale;
  int minOrderQty;
  int minStockWarning;
  List<String> tax;
  String skuid;
  int quantity;
  List<String?>? attrName;
  List<Variant> variants;
  String? shippingFeeType;
  dynamic shippingFee;
  String shippingDays;
  bool refundable;
  bool featured;
  bool todayDeal;
  bool outOfStock;
  bool published;
  bool isActive;
  bool isWishlistindexLoader;
  String createdAt;
  String updatedAt;
  String thumbnail;

  Wishlist({
    required this.id,
    required this.productName,
    required this.fkCategory,
    required this.fkSubcategory,
    required this.fkBrand,
    required this.tags,
    required this.productShortDesc,
    required this.productLongDesc,
    required this.specification,
    required this.productThumbnailName,
    required this.productThumbnailPath,
    required this.productDescImages,
    required this.videoProvider,
    required this.videoUrl,
    required this.offerStartDate,
    required this.offerEndDate,
    required this.offerDiscountType,
    required this.offerDiscount,
    required this.flashSale,
    required this.minOrderQty,
    required this.minStockWarning,
    required this.tax,
    required this.skuid,
    required this.quantity,
    this.attrName,
    required this.variants,
    this.shippingFeeType,
    required this.shippingFee,
    required this.shippingDays,
    required this.refundable,
    required this.featured,
    required this.todayDeal,
    required this.outOfStock,
    required this.published,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.thumbnail,
    this.isWishlistindexLoader = false,
  });

  factory Wishlist.fromJson(Map<String, dynamic> json) => Wishlist(
        id: json["_id"],
        productName: json["product_name"],
        fkCategory: json["fk_category"],
        fkSubcategory: json["fk_subcategory"],
        fkBrand: json["fk_brand"],
        tags: List<dynamic>.from(json["tags"].map((x) => x)),
        productShortDesc: json["product_short_desc"],
        productLongDesc: json["product_long_desc"],
        specification: json["specification"],
        productThumbnailName: json["product_thumbnail_name"],
        productThumbnailPath: json["product_thumbnail_path"],
        productDescImages: List<ProductDescImage>.from(
            json["product_desc_images"]
                .map((x) => ProductDescImage.fromJson(x))),
        videoProvider: json["video_provider"],
        videoUrl: json["video_url"],
        offerStartDate: json["offer_start_date"],
        offerEndDate: json["offer_end_date"],
        offerDiscountType: json["offer_discount_type"],
        offerDiscount: json["offer_discount"],
        flashSale: json["flash_sale"],
        minOrderQty: json["min_order_qty"],
        minStockWarning: json["min_stock_warning"],
        tax: List<String>.from(json["tax"].map((x) => x)),
        skuid: json["skuid"],
        quantity: json["quantity"],
        attrName: List<String?>.from(json["attr_name"].map((x) => x)),
        variants: List<Variant>.from(
            json["variants"].map((x) => Variant.fromJson(x))),
        shippingFeeType: json["shipping_fee_type"],
        shippingFee: json["shipping_fee"],
        shippingDays: json["shipping_days"],
        refundable: json["refundable"],
        featured: json["featured"],
        todayDeal: json["today_deal"],
        outOfStock: json["out_of_stock"],
        published: json["published"],
        isActive: json["isActive"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        thumbnail: json["thumbnail"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "product_name": productName,
        "fk_category": fkCategory,
        "fk_subcategory": fkSubcategory,
        "fk_brand": fkBrand,
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "product_short_desc": productShortDesc,
        "product_long_desc": productLongDesc,
        "specification": specification,
        "product_thumbnail_name": productThumbnailName,
        "product_thumbnail_path": productThumbnailPath,
        "product_desc_images":
            List<dynamic>.from(productDescImages.map((x) => x.toJson())),
        "video_provider": videoProvider,
        "video_url": videoUrl,
        "offer_start_date": offerStartDate,
        "offer_end_date": offerEndDate,
        "offer_discount_type": offerDiscountType,
        "offer_discount": offerDiscount,
        "flash_sale": flashSale,
        "min_order_qty": minOrderQty,
        "min_stock_warning": minStockWarning,
        "tax": List<dynamic>.from(tax.map((x) => x)),
        "skuid": skuid,
        "quantity": quantity,
        "attr_name": List<dynamic>.from(attrName!.map((x) => x)),
        "variants": List<dynamic>.from(variants.map((x) => x.toJson())),
        "shipping_fee_type": shippingFeeType,
        "shipping_fee": shippingFee,
        "shipping_days": shippingDays,
        "refundable": refundable,
        "featured": featured,
        "today_deal": todayDeal,
        "out_of_stock": outOfStock,
        "published": published,
        "isActive": isActive,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "thumbnail": thumbnail,
      };
}

class ProductDescImage {
  String productDescImagesName;
  String productDescImagesPath;
  String id;

  ProductDescImage({
    required this.productDescImagesName,
    required this.productDescImagesPath,
    required this.id,
  });

  factory ProductDescImage.fromJson(Map<String, dynamic> json) =>
      ProductDescImage(
        productDescImagesName: json["product_desc_images_name"],
        productDescImagesPath: json["product_desc_images_path"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "product_desc_images_name": productDescImagesName,
        "product_desc_images_path": productDescImagesPath,
        "_id": id,
      };
}

class Variant {
  Attributes? attributes;
  int price;
  int sellingPrice;
  int stock;
  List<String> images;
  String id;

  Variant({
    this.attributes,
    required this.price,
    required this.sellingPrice,
    required this.stock,
    required this.images,
    required this.id,
  });

  factory Variant.fromJson(Map<String, dynamic> json) => Variant(
        attributes: json["attributes"] == null
            ? null
            : Attributes.fromJson(json["attributes"]),
        price: json["price"],
        sellingPrice: json["selling_price"],
        stock: json["stock"],
        images: List<String>.from(json["images"].map((x) => x)),
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "attributes": attributes!.toJson(),
        "price": price,
        "selling_price": sellingPrice,
        "stock": stock,
        "images": List<dynamic>.from(images.map((x) => x)),
        "_id": id,
      };
}

class Attributes {
  String color;

  Attributes({
    required this.color,
  });

  factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
        color: json["Color"],
      );

  Map<String, dynamic> toJson() => {
        "Color": color,
      };
}
