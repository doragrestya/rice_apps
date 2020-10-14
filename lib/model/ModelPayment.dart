// To parse this JSON data, do
//
//     final modelPayment = modelPaymentFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ModelPayment modelPaymentFromJson(String str) => ModelPayment.fromJson(json.decode(str));

String modelPaymentToJson(ModelPayment data) => json.encode(data.toJson());

class ModelPayment {
  ModelPayment({
    @required this.message,
    @required this.status,
    @required this.payment,
  });

  String message;
  int status;
  List<Payment> payment;

  factory ModelPayment.fromJson(Map<String, dynamic> json) => ModelPayment(
    message: json["message"],
    status: json["status"],
    payment: List<Payment>.from(json["payment"].map((x) => Payment.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "status": status,
    "payment": List<dynamic>.from(payment.map((x) => x.toJson())),
  };
}

class Payment {
  Payment({
    @required this.idPayment,
    @required this.namaPayment,
    @required this.kodePayment,
    @required this.iconPayment,
  });

  String idPayment;
  String namaPayment;
  String kodePayment;
  String iconPayment;

  factory Payment.fromJson(Map<String, dynamic> json) => Payment(
    idPayment: json["id_payment"],
    namaPayment: json["nama_payment"],
    kodePayment: json["kode_payment"],
    iconPayment: json["icon_payment"],
  );

  Map<String, dynamic> toJson() => {
    "id_payment": idPayment,
    "nama_payment": namaPayment,
    "kode_payment": kodePayment,
    "icon_payment": iconPayment,
  };
}
