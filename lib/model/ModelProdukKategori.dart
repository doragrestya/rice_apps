// To parse this JSON data, do
//
//     final modelProdukKategori = modelProdukKategoriFromJson(jsonString);

import 'dart:convert';

ModelProdukKategori modelProdukKategoriFromJson(String str) => ModelProdukKategori.fromJson(json.decode(str));

String modelProdukKategoriToJson(ModelProdukKategori data) => json.encode(data.toJson());

class ModelProdukKategori {
  ModelProdukKategori({
    this.message,
    this.status,
    this.kategoriproduk,
  });

  String message;
  int status;
  List<Kategoriproduk> kategoriproduk;

  factory ModelProdukKategori.fromJson(Map<String, dynamic> json) => ModelProdukKategori(
    message: json["message"],
    status: json["status"],
    kategoriproduk: List<Kategoriproduk>.from(json["kategoriproduk"].map((x) => Kategoriproduk.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "status": status,
    "kategoriproduk": List<dynamic>.from(kategoriproduk.map((x) => x.toJson())),
  };
}

class Kategoriproduk {
  Kategoriproduk({
    this.idProduk,
    this.namaProduk,
    this.hargaProduk,
    this.stokProduk,
    this.gambarProduk,
    this.detailProduk,
    this.idKategori,
    this.idKonsumen,
    this.idSatuan,
    this.namaSatuan,
    this.namaKategori,
    this.keterangan,
    this.iconKategori,
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
  String namaSatuan;
  String namaKategori;
  String keterangan;
  String iconKategori;

  factory Kategoriproduk.fromJson(Map<String, dynamic> json) => Kategoriproduk(
    idProduk: json["id_produk"],
    namaProduk: json["nama_produk"],
    hargaProduk: json["harga_produk"],
    stokProduk: json["stok_produk"],
    gambarProduk: json["gambar_produk"],
    detailProduk: json["detail_produk"],
    idKategori: json["id_kategori"],
    idKonsumen: json["id_konsumen"],
    idSatuan: json["id_satuan"],
    namaSatuan: json["nama_satuan"],
    namaKategori: json["nama_kategori"],
    keterangan: json["keterangan"],
    iconKategori: json["icon_kategori"],
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
    "nama_satuan": namaSatuan,
    "nama_kategori": namaKategori,
    "keterangan": keterangan,
    "icon_kategori": iconKategori,
  };
}
