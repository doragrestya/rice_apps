// To parse this JSON data, do
//
//     final modelShipping = modelShippingFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ModelShipping modelShippingFromJson(String str) => ModelShipping.fromJson(json.decode(str));

String modelShippingToJson(ModelShipping data) => json.encode(data.toJson());

class ModelShipping {
  ModelShipping({
    @required this.message,
    @required this.status,
    @required this.shipping,
  });

  String message;
  int status;
  List<Shipping> shipping;

  factory ModelShipping.fromJson(Map<String, dynamic> json) => ModelShipping(
    message: json["message"],
    status: json["status"],
    shipping: List<Shipping>.from(json["shipping"].map((x) => Shipping.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "status": status,
    "shipping": List<dynamic>.from(shipping.map((x) => x.toJson())),
  };
}

class Shipping {
  Shipping({
    @required this.idShipping,
    @required this.namaShipping,
    @required this.detailShipping,
    @required this.iconShipping,
  });

  String idShipping;
  String namaShipping;
  String detailShipping;
  String iconShipping;

  factory Shipping.fromJson(Map<String, dynamic> json) => Shipping(
    idShipping: json["id_shipping"],
    namaShipping: json["nama_shipping"],
    detailShipping: json["detail_shipping"],
    iconShipping: json["icon_shipping"],
  );

  Map<String, dynamic> toJson() => {
    "id_shipping": idShipping,
    "nama_shipping": namaShipping,
    "detail_shipping": detailShipping,
    "icon_shipping": iconShipping,
  };
}
