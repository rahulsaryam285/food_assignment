// To parse this JSON data, do
//
//     final quntityModel = quntityModelFromJson(jsonString);

import 'dart:convert';

QuntityModel quntityModelFromJson(String str) =>
    QuntityModel.fromJson(json.decode(str));

String quntityModelToJson(QuntityModel data) => json.encode(data.toJson());

class QuntityModel {
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

  QuntityModel({
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
  });

  factory QuntityModel.fromJson(Map<String, dynamic> json) => QuntityModel(
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
      };
}
