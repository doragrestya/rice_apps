// To parse this JSON data, do
//
//     final modelProduk = modelProdukFromJson(jsonString);

import 'dart:convert';

ModelProduk modelProdukFromJson(String str) => ModelProduk.fromJson(json.decode(str));

String modelProdukToJson(ModelProduk data) => json.encode(data.toJson());

class ModelProduk {
  ModelProduk({
    this.message,
    this.status,
    this.data,
  });

  String message;
  int status;
  List<Datum> data;

  factory ModelProduk.fromJson(Map<String, dynamic> json) => ModelProduk(
    message: json["message"],
    status: json["status"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "status": status,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.idProduk,
    this.namaProduk,
    this.hargaProduk,
    this.stokProduk,
    this.gambarProduk,
    this.detailProduk,
    this.idKategori,
    this.idKonsumen,
    this.idSatuan,
  });

  String idProduk;
  String namaProduk;
  String hargaProduk;
  String stokProduk;
  String gambarProduk;
  String detailProduk;
  String idKategori;
  String idKonsumen;
  String idSatuan;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    idProduk: json["id_produk"],
    namaProduk: json["nama_produk"],
    hargaProduk: json["harga_produk"],
    stokProduk: json["stok_produk"],
    gambarProduk: json["gambar_produk"],
    detailProduk: json["detail_produk"],
    idKategori: json["id_kategori"],
    idKonsumen: json["id_konsumen"],
    idSatuan: json["id_satuan"],
  );

  Map<String, dynamic> toJson() => {
    "id_produk": idProduk,
    "nama_produk": namaProduk,
    "harga_produk": hargaProduk,
    "stok_produk": stokProduk,
    "gambar_produk": gambarProduk,
    "detail_produk": detailProduk,
    "id_kategori": idKategori,
    "id_konsumen": idKonsumen,
    "id_satuan": idSatuan,
  };
}
