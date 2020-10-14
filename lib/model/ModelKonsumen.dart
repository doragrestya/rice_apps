// To parse this JSON data, do
//
//     final modelKonsumen = modelKonsumenFromJson(jsonString);

import 'dart:convert';

ModelKonsumen modelKonsumenFromJson(String str) => ModelKonsumen.fromJson(json.decode(str));

String modelKonsumenToJson(ModelKonsumen data) => json.encode(data.toJson());

class ModelKonsumen {
  ModelKonsumen({
    this.status,
    this.message,
    this.konsumen,
  });

  int status;
  String message;
  List<Konsuman> konsumen;

  factory ModelKonsumen.fromJson(Map<String, dynamic> json) => ModelKonsumen(
    status: json["status"],
    message: json["message"],
    konsumen: List<Konsuman>.from(json["konsumen"].map((x) => Konsuman.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "konsumen": List<dynamic>.from(konsumen.map((x) => x.toJson())),
  };
}

class Konsuman {
  Konsuman({
    this.idKonsumen,
    this.fullnameKonsumen,
    this.emailKonsumen,
    this.passwordKonsumen,
    this.nohpKonsumen,
    this.alamatKonsumen,
    this.photoKonsumen,
    this.createdAt,
  });

  String idKonsumen;
  String fullnameKonsumen;
  String emailKonsumen;
  String passwordKonsumen;
  String nohpKonsumen;
  String alamatKonsumen;
  String photoKonsumen;
  DateTime createdAt;

  factory Konsuman.fromJson(Map<String, dynamic> json) => Konsuman(
    idKonsumen: json["id_konsumen"],
    fullnameKonsumen: json["fullname_konsumen"],
    emailKonsumen: json["email_konsumen"],
    passwordKonsumen: json["password_konsumen"],
    nohpKonsumen: json["nohp_konsumen"],
    alamatKonsumen: json["alamat_konsumen"],
    photoKonsumen: json["photo_konsumen"],
    createdAt: DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id_konsumen": idKonsumen,
    "fullname_konsumen": fullnameKonsumen,
    "email_konsumen": emailKonsumen,
    "password_konsumen": passwordKonsumen,
    "nohp_konsumen": nohpKonsumen,
    "alamat_konsumen": alamatKonsumen,
    "photo_konsumen": photoKonsumen,
    "created_at": createdAt.toIso8601String(),
  };
}
