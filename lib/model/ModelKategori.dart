// To parse this JSON data, do
//
//     final modelKategori = modelKategoriFromJson(jsonString);

import 'dart:convert';

ModelKategori modelKategoriFromJson(String str) => ModelKategori.fromJson(json.decode(str));

String modelKategoriToJson(ModelKategori data) => json.encode(data.toJson());

class ModelKategori {
  ModelKategori({
    this.message,
    this.status,
    this.kategori,
  });

  String message;
  int status;
  List<Kategori> kategori;

  factory ModelKategori.fromJson(Map<String, dynamic> json) => ModelKategori(
    message: json["message"] == null ? null : json["message"],
    status: json["status"] == null ? null : json["status"],
    kategori: json["kategori"] == null ? null : List<Kategori>.from(json["kategori"].map((x) => Kategori.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message == null ? null : message,
    "status": status == null ? null : status,
    "kategori": kategori == null ? null : List<dynamic>.from(kategori.map((x) => x.toJson())),
  };
}

class Kategori {
  Kategori({
    this.idKategori,
    this.namaKategori,
    this.keterangan,
    this.iconKategori,
  });

  String idKategori;
  String namaKategori;
  String keterangan;
  String iconKategori;

  factory Kategori.fromJson(Map<String, dynamic> json) => Kategori(
    idKategori: json["id_kategori"] == null ? null : json["id_kategori"],
    namaKategori: json["nama_kategori"] == null ? null : json["nama_kategori"],
    keterangan: json["keterangan"] == null ? null : json["keterangan"],
    iconKategori: json["icon_kategori"] == null ? null : json["icon_kategori"],
  );

  Map<String, dynamic> toJson() => {
    "id_kategori": idKategori == null ? null : idKategori,
    "nama_kategori": namaKategori == null ? null : namaKategori,
    "keterangan": keterangan == null ? null : keterangan,
    "icon_kategori": iconKategori == null ? null : iconKategori,
  };
}
