// To parse this JSON data, do
//
//     final cartModel = cartModelFromJson(jsonString);

import 'dart:convert';

List<CartModel> cartModelFromJson(String str) =>
    List<CartModel>.from(json.decode(str).map((x) => CartModel.fromJson(x)));

String cartModelToJson(List<CartModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CartModel {
  int id;
  int dishesCount;
  int status;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  int restaurentId;
  int userId;
  Restaurent restaurent;
  List<CartDetail> cartDetails;

  CartModel({
    required this.id,
    required this.dishesCount,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.restaurentId,
    required this.userId,
    required this.restaurent,
    required this.cartDetails,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        id: json["id"],
        dishesCount: json["dishes_count"],
        status: json["status"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        deletedAt: json["deletedAt"],
        restaurentId: json["restaurent_id"],
        userId: json["user_id"],
        restaurent: Restaurent.fromJson(json["restaurent"]),
        cartDetails: json["cart_details"] != null
            ? List<CartDetail>.from((json["cart_details"] as List)
                .map((x) => CartDetail.fromJson(x as Map<String, dynamic>)))
            : [],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "dishes_count": dishesCount,
        "status": status,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "deletedAt": deletedAt,
        "restaurent_id": restaurentId,
        "user_id": userId,
        "restaurent": restaurent.toJson(),
        "cart_details": List<dynamic>.from(cartDetails.map((x) => x.toJson())),
      };
}

class CartDetail {
  int id;
  int quantity;
  int customizeSpice;
  int status;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  int cartId;
  int restaurentId;
  int disheId;
  int userId;
  Dish? dish;

  CartDetail({
    required this.id,
    required this.quantity,
    required this.customizeSpice,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.cartId,
    required this.restaurentId,
    required this.disheId,
    required this.userId,
    this.dish,
  });

  factory CartDetail.fromJson(Map<String, dynamic> json) => CartDetail(
        id: json["id"],
        quantity: json["quantity"],
        customizeSpice: json["customize_spice"],
        status: json["status"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        deletedAt: json["deletedAt"],
        cartId: json["cart_id"],
        restaurentId: json["restaurent_id"],
        disheId: json["dishe_id"],
        userId: json["user_id"],
        dish: json["dish"] != null
            ? Dish.fromJson(
                json["dish"],
              )
            : null,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "quantity": quantity,
        "customize_spice": customizeSpice,
        "status": status,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "deletedAt": deletedAt,
        "cart_id": cartId,
        "restaurent_id": restaurentId,
        "dishe_id": disheId,
        "user_id": userId,
        "dish": dish?.toJson(),
      };
}

class Dish {
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

  Dish({
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
  });

  factory Dish.fromJson(Map<String, dynamic> json) => Dish(
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
      };
}

class Restaurent {
  int id;
  String name;
  String image;
  String landmark;
  String address;
  String latitude;
  String longitude;
  int status;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  int userId;
  int countryId;
  int stateId;
  int cityId;
  int pincodeId;

  Restaurent({
    required this.id,
    required this.name,
    required this.image,
    required this.landmark,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.userId,
    required this.countryId,
    required this.stateId,
    required this.cityId,
    required this.pincodeId,
  });

  factory Restaurent.fromJson(Map<String, dynamic> json) => Restaurent(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        landmark: json["landmark"],
        address: json["address"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        status: json["status"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        deletedAt: json["deletedAt"],
        userId: json["user_id"],
        countryId: json["country_id"],
        stateId: json["state_id"],
        cityId: json["city_id"],
        pincodeId: json["pincode_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "landmark": landmark,
        "address": address,
        "latitude": latitude,
        "longitude": longitude,
        "status": status,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "deletedAt": deletedAt,
        "user_id": userId,
        "country_id": countryId,
        "state_id": stateId,
        "city_id": cityId,
        "pincode_id": pincodeId,
      };
}
