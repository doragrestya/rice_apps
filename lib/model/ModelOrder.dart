// To parse this JSON data, do
//
//     final modelOrder = modelOrderFromJson(jsonString);

import 'dart:convert';

ModelOrder modelOrderFromJson(String str) => ModelOrder.fromJson(json.decode(str));

String modelOrderToJson(ModelOrder data) => json.encode(data.toJson());

class ModelOrder {
  ModelOrder({
    this.message,
    this.status,
    this.dataOrder,
  });

  String message;
  int status;
  List<DataOrder> dataOrder;

  factory ModelOrder.fromJson(Map<String, dynamic> json) => ModelOrder(
    message: json["message"],
    status: json["status"],
    dataOrder: List<DataOrder>.from(json["dataOrder"].map((x) => DataOrder.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "status": status,
    "dataOrder": List<dynamic>.from(dataOrder.map((x) => x.toJson())),
  };
}

class DataOrder {
  DataOrder({
    this.idOrder,
    this.tanggalOrder,
    this.idUser,
    this.alamatUser,
    this.orderStatus,
    this.orderTotal,
    this.idShipping,
    this.idPayment,
    this.idCheckout,
    this.idKonsumen,
    this.fullnameKonsumen,
    this.emailKonsumen,
    this.passwordKonsumen,
    this.nohpKonsumen,
    this.alamatKonsumen,
    this.photoKonsumen,
    this.idKeranjang,
    this.namaPayment,
    this.noRek,
    this.iconPayment,
    this.idStatusTransaksi,
    this.statusTransaksi,
    this.keterangan,
  });

  String idOrder;
  DateTime tanggalOrder;
  String idUser;
  String alamatUser;
  String orderStatus;
  String orderTotal;
  String idShipping;
  String idPayment;
  String idCheckout;
  String idKonsumen;
  String fullnameKonsumen;
  String emailKonsumen;
  String passwordKonsumen;
  String nohpKonsumen;
  String alamatKonsumen;
  String photoKonsumen;
  String idKeranjang;
  String namaPayment;
  String noRek;
  String iconPayment;
  String idStatusTransaksi;
  String statusTransaksi;
  String keterangan;

  factory DataOrder.fromJson(Map<String, dynamic> json) => DataOrder(
    idOrder: json["id_order"],
    tanggalOrder: DateTime.parse(json["tanggal_order"]),
    idUser: json["id_user"],
    alamatUser: json["alamat_user"],
    orderStatus: json["order_status"],
    orderTotal: json["order_total"],
    idShipping: json["id_shipping"],
    idPayment: json["id_payment"],
    idCheckout: json["id_checkout"],
    idKonsumen: json["id_konsumen"],
    fullnameKonsumen: json["fullname_konsumen"],
    emailKonsumen: json["email_konsumen"],
    passwordKonsumen: json["password_konsumen"],
    nohpKonsumen: json["nohp_konsumen"],
    alamatKonsumen: json["alamat_konsumen"],
    photoKonsumen: json["photo_konsumen"],
    idKeranjang: json["id_keranjang"],
    namaPayment: json["nama_payment"],
    noRek: json["no_rek"],
    iconPayment: json["icon_payment"],
    idStatusTransaksi: json["id_status_transaksi"],
    statusTransaksi: json["status_transaksi"],
    keterangan: json["keterangan"],
  );

  Map<String, dynamic> toJson() => {
    "id_order": idOrder,
    "tanggal_order": tanggalOrder.toIso8601String(),
    "id_user": idUser,
    "alamat_user": alamatUser,
    "order_status": orderStatus,
    "order_total": orderTotal,
    "id_shipping": idShipping,
    "id_payment": idPayment,
    "id_checkout": idCheckout,
    "id_konsumen": idKonsumen,
    "fullname_konsumen": fullnameKonsumen,
    "email_konsumen": emailKonsumen,
    "password_konsumen": passwordKonsumen,
    "nohp_konsumen": nohpKonsumen,
    "alamat_konsumen": alamatKonsumen,
    "photo_konsumen": photoKonsumen,
    "id_keranjang": idKeranjang,
    "nama_payment": namaPayment,
    "no_rek": noRek,
    "icon_payment": iconPayment,
    "id_status_transaksi": idStatusTransaksi,
    "status_transaksi": statusTransaksi,
    "keterangan": keterangan,
  };
}
