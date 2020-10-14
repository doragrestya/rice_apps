// To parse this JSON data, do
//
//     final modelJumlahKeranjang = modelJumlahKeranjangFromJson(jsonString);

import 'dart:convert';

ModelJumlahKeranjang modelJumlahKeranjangFromJson(String str) => ModelJumlahKeranjang.fromJson(json.decode(str));

String modelJumlahKeranjangToJson(ModelJumlahKeranjang data) => json.encode(data.toJson());

class ModelJumlahKeranjang {
  ModelJumlahKeranjang({
    this.message,
    this.status,
    this.jumlahkeranjang,
  });

  String message;
  int status;
  List<Jumlahkeranjang> jumlahkeranjang;

  factory ModelJumlahKeranjang.fromJson(Map<String, dynamic> json) => ModelJumlahKeranjang(
    message: json["message"],
    status: json["status"],
    jumlahkeranjang: List<Jumlahkeranjang>.from(json["jumlahkeranjang"].map((x) => Jumlahkeranjang.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "status": status,
    "jumlahkeranjang": List<dynamic>.from(jumlahkeranjang.map((x) => x.toJson())),
  };
}

class Jumlahkeranjang {
  Jumlahkeranjang({
    this.jumlah,
  });

  String jumlah;

  factory Jumlahkeranjang.fromJson(Map<String, dynamic> json) => Jumlahkeranjang(
    jumlah: json["jumlah"],
  );

  Map<String, dynamic> toJson() => {
    "jumlah": jumlah,
  };
}
