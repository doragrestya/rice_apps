import 'dart:convert';
import 'dart:io';
import 'package:async/async.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:gorice/constant/ConstantFile.dart';
import 'package:gorice/model/ModelJumlahKeranjang.dart';
import 'package:gorice/model/ModelKategori.dart';
import 'package:gorice/model/ModelKeranjang.dart';
import 'package:gorice/model/ModelOrder.dart';
import 'package:gorice/model/ModelPayment.dart';
import 'package:gorice/model/ModelProdukKategori.dart';
import 'package:gorice/model/ModelShipping.dart';
import 'package:gorice/model/ModelSlider.dart';
import 'package:gorice/model/ModelKonsumen.dart';
import 'package:gorice/ui_page/DashboardPage.dart';
import 'package:gorice/ui_page/profile/LoginPage.dart';
import 'package:http/http.dart' as http;

abstract class BaseEndPoint {
  void registerKonsumen(String myNama, String myEmail, String myTelp,
      String myAlamat, String myPassword, BuildContext context);
  Future<List> loginKonsumen(
      String myEmail, String myPassword, BuildContext context);
  void updateImage(String idKonsumen, File imageUser);
  void updateProfile(String idUser, String myName, String myEmail,
      String myTelp, String myAlamat);
  Future<List> getKategori(String idKategori);
  Future<List> getPayment();
  Future<List> getShipping();
  Future<List> getSlider();
  Future<List> getJumlahKeranjang(String myId, String idStatus);
  Future<void> getKeranjang(String myd, String idStatus);
  Future<List> getProdukKategori(String idKategori);
  void decrementCounter(String myId, String idProduk);
  void addUpdateTransaksi(String totalHarga, String jumlahProduk,
      String idProduk, String idUser, String detailOrder);
  void deleteProdukKeranjang(String idProduk);
  Future<List> getTotalBelanja(
      String idUser, String idStatus, String detailOrder);
  void addOrder(String idUser, String idCheckout, String alamatUser,
      String orderStatus, String idPayment, String idShipping);
  void checkoutTransaksiBaru(
      String idUser, String idStatus, String detailOrder);
  void updateOrderTotal(String detailOrder, String idStatus, String idUser);
  void updateStok(String idStatus, String orderDetail);
  void updateTotalJual(String idUser, String idStatus, String detailOrder);
  void uploadBukti(
    String idCheck,
    String namaKonsumen,
    String notelp,
    String jumlahTransfer,
    File image,
  );
  void updateOrderStatus(String idCheckout);
  Future<List> getOrder(String idUser, String orderStatus);
  Future<List> getDataOrder(String idCheckout, String orderStatus);
  Future<List> getPesanan(String idCheckout);
}

class NetworkProvider extends BaseEndPoint {
  @override
  Future<List> loginKonsumen(
      String myEmail, String myPassword, BuildContext context) async {
    // TODO: implement loginUser
    final response = await http.post(ConstantFile().baseUrl + "loginKonsumen",
        body: {'email': myEmail, 'password': myPassword});

    try{
      ModelKonsumen listData = modelKonsumenFromJson(response.body);
      if (listData.status == 200) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => DashboardPage()));
        return listData.konsumen;
      } else {
        print(listData.message);
        return null;
      }
    }catch(e){
      return null;
    }
  }

  @override
  void registerKonsumen(String myName, String myEmail, String myTelp,
      String myAlamat, String myPassword, BuildContext context) async {
    // TODO: implement registerUser

    final response =
        await http.post(ConstantFile().baseUrl + "registerKonsumen", body: {
      'name': myName,
      'email': myEmail,
      'nohp': myTelp,
      'alamat': myAlamat,
      'password': myPassword
    });
    var listData = jsonDecode(response.body);

    if (listData['status'] == 200) {
      print(listData['message']);
      AwesomeDialog(
          context: context,
          dialogType: DialogType.SUCCES,
          animType: AnimType.BOTTOMSLIDE,
          title: 'Information Register',
          desc: listData['message'],
          btnOkText: "Go to Login",
          btnOkOnPress: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => LoginPage()));
          }).show();
    } else {
      print(listData['message']);
      AwesomeDialog(
              context: context,
              dialogType: DialogType.ERROR,
              animType: AnimType.BOTTOMSLIDE,
              title: 'Information Register',
              desc: listData['message'],
              btnOkOnPress: () {})
          .show();
    }
  }

  @override
  void updateImage(String idKonsumen, File imageUser) async {
    // TODO: implement updateImage
//    print("length: ${imageUser.length} Path: ${imageUser.path}");
    var stream = http.ByteStream(DelegatingStream.typed(imageUser.openRead()));
    var length = await imageUser.length();
    var request = http.MultipartRequest(
        'POST', Uri.parse(ConstantFile().baseUrl + 'updateImage'));

    var multipart =
        http.MultipartFile('image', stream, length, filename: imageUser.path);
    request.files.add(multipart);
    request.fields['idkonsumen'] = idKonsumen;
    var response = await request.send();
    if (response.statusCode == 200) {
      print('Image Uploaded');
    } else {
      print('Image Failed Uploaded');
    }
  }

  @override
  Future<List> getKategori(String idKategori) async {
    // TODO: implement getKategori
    final response = await http.post(ConstantFile().baseUrl + "getKategori",
        body: {'idKategori': idKategori});
    ModelKategori listData = modelKategoriFromJson(response.body);
    return listData.kategori;
  }

  @override
  Future<List> getPayment() async {
    // TODO: implement getBank
    final response = await http.post(ConstantFile().baseUrl + "getPayment");
    ModelPayment listData = modelPaymentFromJson(response.body);
    return listData.payment;
  }

  @override
  Future<List> getSlider() async {
    // TODO: implement getSlider
    final response = await http.post(ConstantFile().baseUrl + "getSlider");
    ModelSlider listData = modelSliderFromJson(response.body);
    return listData.dataslider;
  }

  @override
  Future<List> getProdukKategori(String idKategori) async {
    // TODO: implement getProdukKategori
    final response = await http.post(
        ConstantFile().baseUrl + "getProdukKategori",
        body: {'idkategori': idKategori});
    ModelProdukKategori listData = modelProdukKategoriFromJson(response.body);
    return listData.kategoriproduk;
  }

  @override
  Future<List> getShipping() async {
    // TODO: implement getShipping
    final response = await http.post(ConstantFile().baseUrl + "getShipping");
    ModelShipping listData = modelShippingFromJson(response.body);
    return listData.shipping;
  }

  @override
  void addUpdateTransaksi(String totalHarga, String jumlahProduk,
      String idProduk, String idUser, String detailOrder) async {
    // TODO: implement addUpdateTransaksi
    await http.post(ConstantFile().baseUrl + "addUpdateTransaksi", body: {
      'id_produk': idProduk,
      'id_user': idUser,
      'detail_order': detailOrder,
      'harga_produk': totalHarga,
      'jumlah_produk': jumlahProduk,
    });
  }

  @override
  Future<List> getJumlahKeranjang(String myId, String idStatus) async {
    // TODO: implement getJumlahKeranjang
    final response =
        await http.post(ConstantFile().baseUrl + "jumlahKeranjang", body: {
      'id_user': myId,
      'id_status_transaksi': idStatus,
    });

    ModelJumlahKeranjang listData = modelJumlahKeranjangFromJson(response.body);
    return listData.jumlahkeranjang;
  }

  @override
  Future<void> getKeranjang(String myId, String idStatus) async {
    // TODO: implement getKeranjang
    final response =
        await http.post(ConstantFile().baseUrl + "getKeranjang", body: {
      'id_user': myId,
      'id_status_transaksi': idStatus,
    });
    ModelKeranjang listData = modelKeranjangFromJson(response.body);
    return listData.dataKeranjang;
  }

  @override
  void decrementCounter(String myId, String idProduk) async {
    // TODO: implement decrementCounter
    await http.post(ConstantFile().baseUrl + "decrementCounter", body: {
      'id_produk': idProduk,
      'id_user': myId,
    });
  }

  @override
  void deleteProdukKeranjang(String idProduk) async {
    // TODO: implement deleteProdukKeranjang
    final response = await http.post(
        ConstantFile().baseUrl + "deleteProdukKeranjang",
        body: {'id_produk': idProduk});

    var listData = jsonDecode(response.body);
    if (listData['status'] == 200) {
      print(listData['message']);
    } else {
      print(listData['message']);
    }
  }

  @override
  Future<List> getTotalBelanja(
      String idUser, String idStatus, String detailOrder) async {
    // TODO: implement getTotalBelanja
    final response =
        await http.post(ConstantFile().baseUrl + "totalBelanja", body: {
      'id_user': idUser,
      'id_status_transaksi': idStatus,
      'detail_order': detailOrder,
    });
    return json.decode(response.body);
  }

  @override
  void addOrder(String idUser, String idCheckout, String alamatUser,
      String orderStatus, String idPayment, String idShipping) async {
    // TODO: implement addOrder
    await http.post(ConstantFile().baseUrl + "addOrder", body: {
      'id_user': idUser,
      'id_checkout': idCheckout,
      'alamat_user': alamatUser,
      'order_status': orderStatus,
      'id_payment': idPayment,
      'id_shipping': idShipping
    });
  }

  @override
  void checkoutTransaksiBaru(
      String idUser, String idStatus, String detailOrder) async {
    // TODO: implement checkoutTransaksiBaru
    final response = await http
        .post(ConstantFile().baseUrl + "checkoutTransaksiBaru", body: {
      'id_user': idUser,
      'id_status_transaksi': idStatus,
      'order_detail': detailOrder
    });
  }

  @override
  void updateOrderTotal(
      String detailOrder, String idStatus, String idUser) async {
    // TODO: implement updateOrderTotal
    await http.post(ConstantFile().baseUrl + "updateOrderTotal", body: {
      'detail_order': detailOrder,
      'id_status_transaksi': idStatus,
      'id_user': idUser,
    });
  }

  @override
  void updateStok(String idStatus, String orderDetail) async {
    // TODO: implement updateStok
    await http.post(ConstantFile().baseUrl + "updateStok",
        body: {'id_status_transaksi': idStatus, 'detail_order': orderDetail});
  }

  @override
  void updateTotalJual(
      String idUser, String idStatus, String detailOrder) async {
    // TODO: implement updateTotalJual
    await http.post(ConstantFile().baseUrl + "updateTotalJual", body: {
      'id_user': idUser,
      'id_status_transaksi': idStatus,
      'detail_order': detailOrder,
    });
  }

  @override
  void uploadBukti(String idCheck, String namaKonsumen, String notelp,
      String jumlahTransfer, File image) async {
    // TODO: implement uploadBukti
    var stream = http.ByteStream(DelegatingStream.typed(image.openRead()));
    var length = await image.length();
    var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            ConstantFile().baseUrl + "uploadBukti")); // http.MultiparRequest

    var multipart =
        http.MultipartFile('image', stream, length, filename: image.path);

    request.files.add(multipart);
    request.fields['id_checkout'] = idCheck;
    request.fields['nama_konsumen'] = namaKonsumen;
    request.fields['notelp'] = notelp;
    request.fields['jumlah_transfer'] = jumlahTransfer;
    var response = await request.send();

    if (response.statusCode == 200) {
      print("Image Uploaded");
    } else {
      print("Image Failed Uploaded");
    }
  }

  @override
  void updateOrderStatus(String idCheckout) async {
    // TODO: implement updateOrderStatus
    await http.post(ConstantFile().baseUrl + "updateOrderStatus", body: {
      'id_checkout': idCheckout,
    });
  }

  @override
  Future<List> getOrder(String idUser, String orderStatus) async {
    // TODO: implement getOrder
    final response =
        await http.post(ConstantFile().baseUrl + "getOrder", body: {
      'id_user': idUser,
      'order_status': orderStatus,
    });
    ModelOrder listData = modelOrderFromJson(response.body);
    return listData.dataOrder;
  }

  @override
  Future<List> getDataOrder(String idCheckout, String orderStatus) async {
    // TODO: implement getDataOrder
    final response = await http.post(ConstantFile().baseUrl + "getDataOrder",
        body: {'id_checkout': idCheckout, 'order_status': orderStatus});
    ModelOrder listData = modelOrderFromJson(response.body);
    return listData.dataOrder;
  }

  @override
  Future<List> getPesanan(String idCheckout) async {
    // TODO: implement getPesanan
    final response =
        await http.post(ConstantFile().baseUrl + "getPesanan", body: {
      'id_checkout': idCheckout,
    });
    ModelKeranjang listData = modelKeranjangFromJson(response.body);
    return listData.dataKeranjang;
  }

  @override
  void updateProfile(String idUser, String myName, String myEmail,
      String myTelp, String myAlamat) async {
    // TODO: implement updateProfile
    final response =
        await http.post(ConstantFile().baseUrl + "updateProfile", body: {
      'idKonsumen': idUser,
      'name': myName,
      'email': myEmail,
      'nohp': myTelp,
      'alamat': myAlamat
    });

    var listData = jsonDecode(response.body);
    if (listData['status'] == 200) {
      print(listData['message']);
    } else {
      print(listData['message']);
    }
  }
}
