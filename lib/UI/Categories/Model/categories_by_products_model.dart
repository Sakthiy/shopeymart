// To parse this JSON data, do
//
//     final categoriesByProductsModel = categoriesByProductsModelFromJson(jsonString);

import 'dart:convert';

CategoriesByProductsModel categoriesByProductsModelFromJson(String str) => CategoriesByProductsModel.fromJson(json.decode(str));

String categoriesByProductsModelToJson(CategoriesByProductsModel data) => json.encode(data.toJson());

class CategoriesByProductsModel {
  bool success;
  int count;
  List<Datum> data;

  CategoriesByProductsModel({
    required this.success,
    required this.count,
    required this.data,
  });

  factory CategoriesByProductsModel.fromJson(Map<String, dynamic> json) => CategoriesByProductsModel(
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
  String productName;
  FkCategory fkCategory;
  dynamic fkSubcategory;
  FkBrand? fkBrand;
  List<dynamic> tags;
  String productShortDesc;
  String productLongDesc;
  String specification;
  String productThumbnailName;
  String productThumbnailPath;
  List<dynamic> productDescImages;
  String videoProvider;
  String videoUrl;
  DateTime offerStartDate;
  DateTime offerEndDate;
  String offerDiscountType;
  int offerDiscount;
  String flashSale;
  int minOrderQty;
  int minStockWarning;
  List<String> tax;
  String skuid;
  int quantity;
  List<String?> attrName;
  List<Variant> variants;
  String shippingFeeType;
  dynamic shippingFee;
  String shippingDays;
  bool refundable;
  bool featured;
  bool todayDeal;
  bool outOfStock;
  bool published;
  bool isActive;
  DateTime createdAt;
  DateTime updatedAt;
  String thumbnail;
  List<dynamic> review;
  bool isInWishlist;
  String date;

  Datum({
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
    required this.attrName,
    required this.variants,
    required this.shippingFeeType,
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
    required this.review,
    required this.isInWishlist,
    required this.date,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["_id"],
    productName: json["product_name"],
    fkCategory: FkCategory.fromJson(json["fk_category"]),
    fkSubcategory: json["fk_subcategory"],
    fkBrand: json["fk_brand"] == null ? null : FkBrand.fromJson(json["fk_brand"]),
    tags: List<dynamic>.from(json["tags"].map((x) => x)),
    productShortDesc: json["product_short_desc"],
    productLongDesc: json["product_long_desc"],
    specification: json["specification"],
    productThumbnailName: json["product_thumbnail_name"],
    productThumbnailPath: json["product_thumbnail_path"],
    productDescImages: List<dynamic>.from(json["product_desc_images"].map((x) => x)),
    videoProvider: json["video_provider"],
    videoUrl: json["video_url"],
    offerStartDate: DateTime.parse(json["offer_start_date"]),
    offerEndDate: DateTime.parse(json["offer_end_date"]),
    offerDiscountType: json["offer_discount_type"],
    offerDiscount: json["offer_discount"],
    flashSale: json["flash_sale"],
    minOrderQty: json["min_order_qty"],
    minStockWarning: json["min_stock_warning"],
    tax: List<String>.from(json["tax"].map((x) => x)),
    skuid: json["skuid"],
    quantity: json["quantity"],
    attrName: List<String?>.from(json["attr_name"].map((x) => x)),
    variants: List<Variant>.from(json["variants"].map((x) => Variant.fromJson(x))),
    shippingFeeType: json["shipping_fee_type"],
    shippingFee: json["shipping_fee"],
    shippingDays: json["shipping_days"],
    refundable: json["refundable"],
    featured: json["featured"],
    todayDeal: json["today_deal"],
    outOfStock: json["out_of_stock"],
    published: json["published"],
    isActive: json["isActive"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    thumbnail: json["thumbnail"],
    review: List<dynamic>.from(json["review"].map((x) => x)),
    isInWishlist: json["isInWishlist"],
    date: json["date"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "product_name": productName,
    "fk_category": fkCategory.toJson(),
    "fk_subcategory": fkSubcategory,
    "fk_brand": fkBrand!.toJson(),
    "tags": List<dynamic>.from(tags.map((x) => x)),
    "product_short_desc": productShortDesc,
    "product_long_desc": productLongDesc,
    "specification": specification,
    "product_thumbnail_name": productThumbnailName,
    "product_thumbnail_path": productThumbnailPath,
    "product_desc_images": List<dynamic>.from(productDescImages.map((x) => x)),
    "video_provider": videoProvider,
    "video_url": videoUrl,
    "offer_start_date": offerStartDate.toIso8601String(),
    "offer_end_date": offerEndDate.toIso8601String(),
    "offer_discount_type": offerDiscountType,
    "offer_discount": offerDiscount,
    "flash_sale": flashSale,
    "min_order_qty": minOrderQty,
    "min_stock_warning": minStockWarning,
    "tax": List<dynamic>.from(tax.map((x) => x)),
    "skuid": skuid,
    "quantity": quantity,
    "attr_name": List<dynamic>.from(attrName.map((x) => x)),
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
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "thumbnail": thumbnail,
    "review": List<dynamic>.from(review.map((x) => x)),
    "isInWishlist": isInWishlist,
    "date": date,
  };
}

class FkBrand {
  String id;
  String brandName;

  FkBrand({
    required this.id,
    required this.brandName,
  });

  factory FkBrand.fromJson(Map<String, dynamic> json) => FkBrand(
    id: json["_id"],
    brandName: json["brand_name"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "brand_name": brandName,
  };
}

class FkCategory {
  String id;
  String categoryName;

  FkCategory({
    required this.id,
    required this.categoryName,
  });

  factory FkCategory.fromJson(Map<String, dynamic> json) => FkCategory(
    id: json["_id"],
    categoryName: json["category_name"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "category_name": categoryName,
  };
}

class Variant {
  int price;
  int sellingPrice;
  int stock;
  List<String> images;
  String id;
  Attributes attributes;

  Variant({
    required this.price,
    required this.sellingPrice,
    required this.stock,
    required this.images,
    required this.id,
    required this.attributes,
  });

  factory Variant.fromJson(Map<String, dynamic> json) => Variant(
    price: json["price"],
    sellingPrice: json["selling_price"],
    stock: json["stock"],
    images: List<String>.from(json["images"].map((x) => x)),
    id: json["_id"],
    attributes: Attributes.fromJson(json["attributes"]),
  );

  Map<String, dynamic> toJson() => {
    "price": price,
    "selling_price": sellingPrice,
    "stock": stock,
    "images": List<dynamic>.from(images.map((x) => x)),
    "_id": id,
    "attributes": attributes.toJson(),
  };
}

class Attributes {
  Attributes();

  factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
  );

  Map<String, dynamic> toJson() => {
  };
}
