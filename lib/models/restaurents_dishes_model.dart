// To parse this JSON data, do
//
//     final restaurentsDishesModel = restaurentsDishesModelFromJson(jsonString);

import 'dart:convert';

RestaurentsDishesModel restaurentsDishesModelFromJson(String str) =>
    RestaurentsDishesModel.fromJson(json.decode(str));

String restaurentsDishesModelToJson(RestaurentsDishesModel data) =>
    json.encode(data.toJson());

class RestaurentsDishesModel {
  List<Datum> data;
  int currentPage;
  int totalPages;
  int perPage;
  int totalEntries;
  String name;

  RestaurentsDishesModel({
    required this.data,
    required this.currentPage,
    required this.totalPages,
    required this.perPage,
    required this.totalEntries,
    required this.name,
  });

  factory RestaurentsDishesModel.fromJson(Map<String, dynamic> json) =>
      RestaurentsDishesModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        currentPage: json["currentPage"],
        totalPages: json["totalPages"],
        perPage: json["per_page"],
        totalEntries: json["totalEntries"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "currentPage": currentPage,
        "totalPages": totalPages,
        "per_page": perPage,
        "totalEntries": totalEntries,
        "name": name,
      };
}

class Datum {
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
  Category category;
  Category foodType;
  Favorite? favorite;
  int? quantity;

  Datum({
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
    required this.category,
    required this.foodType,
    required this.favorite,
    this.quantity,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
        category: Category.fromJson(json["category"]),
        foodType: Category.fromJson(json["food_type"]),
        favorite: json["favorite"] == null
            ? null
            : Favorite.fromJson(json["favorite"]),
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
        "category": category.toJson(),
        "food_type": foodType.toJson(),
        "favorite": favorite?.toJson(),
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

class Favorite {
  int id;
  int status;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  int userId;
  int disheId;

  Favorite({
    required this.id,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.userId,
    required this.disheId,
  });

  factory Favorite.fromJson(Map<String, dynamic> json) => Favorite(
        id: json["id"],
        status: json["status"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        deletedAt: json["deletedAt"],
        userId: json["user_id"],
        disheId: json["dishe_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "deletedAt": deletedAt,
        "user_id": userId,
        "dishe_id": disheId,
      };
}
