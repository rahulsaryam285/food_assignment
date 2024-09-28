// To parse this JSON data, do
//
//     final allDishesModel = allDishesModelFromJson(jsonString);

import 'dart:convert';

List<AllDishesModel> allDishesModelFromJson(String str) =>
    List<AllDishesModel>.from(
        json.decode(str).map((x) => AllDishesModel.fromJson(x)));

String allDishesModelToJson(List<AllDishesModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AllDishesModel {
  int id;
  String name;
  String image;
  String coverImage;
  String time;
  String description;
  String price;
  String adminPrice;
  String packagingCharges;
  int discount;
  String vote;
  int customizeSpice;
  int freeDelivery;
  int bestSeller;
  int recommended;
  int acceptReject;
  int status;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  int userId;
  int restaurentId;
  int foodTypeId;
  int categoryId;
  Category foodType;
  Category category;
  int? quantity;

  AllDishesModel({
    required this.id,
    required this.name,
    required this.image,
    required this.coverImage,
    required this.time,
    required this.description,
    required this.price,
    required this.adminPrice,
    required this.packagingCharges,
    required this.discount,
    required this.vote,
    required this.customizeSpice,
    required this.freeDelivery,
    required this.bestSeller,
    required this.recommended,
    required this.acceptReject,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.userId,
    required this.restaurentId,
    required this.foodTypeId,
    required this.categoryId,
    required this.foodType,
    required this.category,
    this.quantity,
  });

  factory AllDishesModel.fromJson(Map<String, dynamic> json) => AllDishesModel(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        coverImage: json["cover_image"],
        time: json["time"],
        description: json["description"],
        price: json["price"],
        adminPrice: json["admin_price"],
        packagingCharges: json["packaging_charges"],
        discount: json["discount"],
        vote: json["vote"],
        customizeSpice: json["customize_spice"],
        freeDelivery: json["free_delivery"],
        bestSeller: json["best_seller"],
        recommended: json["recommended"],
        acceptReject: json["accept_reject"],
        status: json["status"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        deletedAt: json["deletedAt"],
        userId: json["user_id"],
        restaurentId: json["restaurent_id"],
        foodTypeId: json["food_type_id"],
        categoryId: json["category_id"],
        foodType: Category.fromJson(json["food_type"]),
        category: Category.fromJson(json["category"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "cover_image": coverImage,
        "time": time,
        "description": description,
        "price": price,
        "admin_price": adminPrice,
        "packaging_charges": packagingCharges,
        "discount": discount,
        "vote": vote,
        "customize_spice": customizeSpice,
        "free_delivery": freeDelivery,
        "best_seller": bestSeller,
        "recommended": recommended,
        "accept_reject": acceptReject,
        "status": status,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "deletedAt": deletedAt,
        "user_id": userId,
        "restaurent_id": restaurentId,
        "food_type_id": foodTypeId,
        "category_id": categoryId,
        "food_type": foodType.toJson(),
        "category": category.toJson(),
      };
}

class Category {
  int id;
  String name;
  String? image;
  String? topColor;
  String? bottomColor;
  int status;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  Category({
    required this.id,
    required this.name,
    required this.image,
    this.topColor,
    this.bottomColor,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        topColor: json["top_color"],
        bottomColor: json["bottom_color"],
        status: json["status"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        deletedAt: json["deletedAt"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "top_color": topColor,
        "bottom_color": bottomColor,
        "status": status,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "deletedAt": deletedAt,
      };
}
