// To parse this JSON data, do
//
//     final modelKeranjang = modelKeranjangFromJson(jsonString);

import 'dart:convert';

ModelKeranjang modelKeranjangFromJson(String str) => ModelKeranjang.fromJson(json.decode(str));

String modelKeranjangToJson(ModelKeranjang data) => json.encode(data.toJson());

class ModelKeranjang {
  ModelKeranjang({
    this.message,
    this.status,
    this.dataKeranjang,
  });

  String message;
  int status;
  List<DataKeranjang> dataKeranjang;

  factory ModelKeranjang.fromJson(Map<String, dynamic> json) => ModelKeranjang(
    message: json["message"],
    status: json["status"],
    dataKeranjang: List<DataKeranjang>.from(json["dataKeranjang"].map((x) => DataKeranjang.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "status": status,
    "dataKeranjang": List<dynamic>.from(dataKeranjang.map((x) => x.toJson())),
  };
}

class DataKeranjang {
  DataKeranjang({
    this.idKeranjang,
    this.idUser,
    this.idProduk,
    this.detailOrder,
    this.jumlahProduk,
    this.totalHargaProduk,
    this.idStatusTransaksi,
    this.createdAt,
    this.namaProduk,
    this.hargaProduk,
    this.stokProduk,
    this.gambarProduk,
    this.detailProduk,
    this.idKategori,
    this.idKonsumen,
  });

  String idKeranjang;
  String idUser;
  String idProduk;
  String detailOrder;
  String jumlahProduk;
  String totalHargaProduk;
  String idStatusTransaksi;
  DateTime createdAt;
  String namaProduk;
  String hargaProduk;
  String stokProduk;
  String gambarProduk;
  String detailProduk;
  String idKategori;
  String idKonsumen;

  factory DataKeranjang.fromJson(Map<String, dynamic> json) => DataKeranjang(
    idKeranjang: json["id_keranjang"],
    idUser: json["id_user"],
    idProduk: json["id_produk"],
    detailOrder: json["detail_order"],
    jumlahProduk: json["jumlah_produk"],
    totalHargaProduk: json["total_harga_produk"],
    idStatusTransaksi: json["id_status_transaksi"],
    createdAt: DateTime.parse(json["created_at"]),
    namaProduk: json["nama_produk"],
    hargaProduk: json["harga_produk"],
    stokProduk: json["stok_produk"],
    gambarProduk: json["gambar_produk"],
    detailProduk: json["detail_produk"],
    idKategori: json["id_kategori"],
    idKonsumen: json["id_konsumen"],
  );

  Map<String, dynamic> toJson() => {
    "id_keranjang": idKeranjang,
    "id_user": idUser,
    "id_produk": idProduk,
    "detail_order": detailOrder,
    "jumlah_produk": jumlahProduk,
    "total_harga_produk": totalHargaProduk,
    "id_status_transaksi": idStatusTransaksi,
    "created_at": createdAt.toIso8601String(),
    "nama_produk": namaProduk,
    "harga_produk": hargaProduk,
    "stok_produk": stokProduk,
    "gambar_produk": gambarProduk,
    "detail_produk": detailProduk,
    "id_kategori": idKategori,
    "id_konsumen": idKonsumen,
  };
}
