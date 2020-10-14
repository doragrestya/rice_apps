import 'dart:convert';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gorice/constant/ConstantFile.dart';
import 'package:gorice/model/ModelKeranjang.dart';
import 'package:gorice/model/ModelPayment.dart';
import 'package:gorice/model/ModelShipping.dart';
import 'package:gorice/network/NetworkProvider.dart';
import 'package:gorice/ui_page/checkout/ResultPage.dart';
import 'file:///D:/SEMESTER%205/Flutter/gorice/lib/ui_page/checkout/BuktiTransaksiPage.dart';
import 'package:gorice/utils/GenerateCode.dart';
import 'package:gorice/utils/SessionManager.dart';
import 'package:http/http.dart' as http;

class CheckOutPage extends StatefulWidget {
  List list;
  String nama, harga, gambar;
  CheckOutPage({this.nama, this.harga, this.gambar, this.list});
  @override
  _CheckOutPageState createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  String myId, myName, myEmail, myTelp, myPhoto, myPassword, myAlamat;
  String globalCode;
  SessionManager sessionManager = SessionManager();
  BaseEndPoint network = NetworkProvider();

  GenerateCode generateCode = GenerateCode();

  List<Payment> _dataBank = List();
  String _valBank;
  List<Shipping> _dataKurir = List();
  String _valKurir;

  void getBank() async {
    await network.getPayment().then((value) {
      setState(() {
        _dataBank = value;
      });
    });
  }

  void getKurir() async {
    await network.getShipping().then((value) {
      setState(() {
        _dataKurir = value;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getBank();
    getKurir();
    sessionManager.getPreference().then((value) {
      setState(() {
        myId = sessionManager.globIduser;
        myName = sessionManager.globName;
        myEmail = sessionManager.globEmail;
//        myPhoto = sessionManager.globPhoto;
        myAlamat = sessionManager.globAlamat;
      });
    });
    generateCode.getCode().then((value) {
      setState(() {
        globalCode = generateCode.globalCode;

        print(globalCode);
      });
    });
  }

  getTotalBelanja(String idUser, String idStatus, String detailOrder) async {
    final response =
    await http.post(ConstantFile().baseUrl + "totalBelanja", body: {
      'id_user': idUser,
      'id_status_transaksi': idStatus,
      'detail_order': detailOrder,
    });
    return json.decode(response.body);
  }

  var _chars = '1234567890';
  Random _random = Random();

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_random.nextInt(_chars.length))));

  void alertCheckout() {
    AlertDialog alertDialog = AlertDialog(
      title: Text('Are You Sure to Checkout ?'),
      content: Text(
          "Pastikan Anda telah memilih Metode Pembayaran dan Metode Pengiriman."),
      actions: <Widget>[
        RaisedButton(
          color: Colors.red,
          child: Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        RaisedButton(
          color: Colors.green,
          child: Text('Checkout'),
          onPressed: () async {
            await network.addOrder(
                myId, globalCode, myAlamat, "2", _valBank, _valKurir);
            await network.checkoutTransaksiBaru(myId, "1", globalCode);
            await network.updateOrderTotal(globalCode, "2", myId);
            await network.updateStok("2", globalCode);
            await network.updateTotalJual(myId, "2", globalCode);

            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => ResultPage(kode: _valBank)));
          },
        ),
      ],
    );
    showDialog(
      context: context,
      child: alertDialog,
      barrierDismissible: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'CheckOut',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          ),
          centerTitle: true,
        ),
        body: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: MediaQuery.of(context).size.height / 7,
                color: Colors.green,
                child: Card(
                  elevation: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Alamat Pengirim',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          myAlamat == null ? "" : myAlamat,
                          style: TextStyle(fontSize: 15),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.green,
                  child: Card(
                    elevation: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Metode Pembayaran',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 120),
                              child: DropdownButton(
                                hint: Text("Pilih Metode Pembayaran"),
                                value: _valBank,
                                items: _dataBank.map((item) {
                                  return DropdownMenuItem(
                                    child: Text(item.namaPayment),
                                    value: item.idPayment,
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    _valBank = value;
                                    print(_valBank);
                                  });
                                },
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                'Daftar Belanja',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FutureBuilder(
                  future: network.getKeranjang(myId, "1"),
                  builder: (context, result) {
                    if (result.hasError) print(result.error);
                    return result.hasData
                        ? ListKeranjang(list: result.data)
                        : Center(child: CircularProgressIndicator());
                  }),
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.green,
                  child: Card(
                    elevation: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Metode Shipping',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 150),
                              child: DropdownButton(
                                hint: Text("Pilih Metode Shipping"),
                                value: _valKurir,
                                items: _dataKurir.map((item) {
                                  return DropdownMenuItem(
                                    child: Text(item.namaShipping),
                                    value: item.idShipping,
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    _valKurir = value;
                                    print(_valKurir);
                                  });
                                },
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )),
            Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                    height: MediaQuery.of(context).size.height / 5,
                    color: Colors.green,
                    child: Card(
                        elevation: 3,
                        child: ListView(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Ringkasan Pembayaran',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                              const EdgeInsets.only(left: 10.0, top: 5, right: 10),
                              child: Container(
                                height: MediaQuery.of(context).size.height / 5,
                                  child: ListView(
                                    children: <Widget>[
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 20.0, right: 20, top: 15),
                                            child: Text(
                                              'Subtotal',
                                              style: TextStyle(
                                                  fontSize: 16, fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(top: 5.0, right: 15),
                                            child: Container(
                                              width: MediaQuery.of(context).size.width / 4,
                                              height: 20,
                                              child: FutureBuilder(
                                                  future: network.getTotalBelanja(
                                                      myId, "1", globalCode),
                                                  builder: (context, result) {
                                                    if (result.hasError) print(result.error);
                                                    return result.hasData
                                                        ? RincianPage(list: result.data)
                                                        : Center(
                                                      child: CircularProgressIndicator(),
                                                    );
                                                  }),
                                            ),
                                          )
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 20.0, right: 20, top: 5),
                                            child: Text(
                                              'Total Bayar',
                                              style: TextStyle(
                                                  fontSize: 16, fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(top: 5.0, right: 15),
                                            child: Container(
                                              width: MediaQuery.of(context).size.width / 4,
                                              height: 15,
                                              child: FutureBuilder(
                                                  future: network.getTotalBelanja(
                                                      myId, "1", globalCode),
                                                  builder: (context, result) {
                                                    if (result.hasError) print(result.error);
                                                    return result.hasData
                                                        ? RincianPage(list: result.data)
                                                        : Center(
                                                      child: CircularProgressIndicator(),
                                                    );
                                                  }),
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                              ),
                            ),
                          ],
                        )))),
            Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Text(
                  'Dengan membayar, saya menyetujui syarat dan ketentuan yang berlaku.',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green),
                )),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: RaisedButton(
                  onPressed: () {
                    alertCheckout();
                  },
                  color: Colors.green,
                  child: Text(
                    'Checkout',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}

class ListKeranjang extends StatefulWidget {
  List list;
  ListKeranjang({this.list});
  @override
  _ListKeranjangState createState() => _ListKeranjangState();
}

class _ListKeranjangState extends State<ListKeranjang> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: widget.list == null ? 0 : widget.list.length,
        itemBuilder: (context, index) {
          DataKeranjang data = widget.list[index];
          return Padding(
              padding: EdgeInsets.all(5),
              child: Container(
                  child: Card(
                      elevation: 3,
                      child: Row(children: <Widget>[
                        Flexible(
                          flex: 4,
                          child: Container(
                            height: 130,
                            width: 130,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: data.gambarProduk == null
                                  ? Center()
                                  : Image.network(
                                      ConstantFile().imageUrl +
                                          data.gambarProduk,
                                      width: 50,
                                      fit: BoxFit.cover,
                                    ),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 8,
                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Container(
                                        width: 100,
                                        child: data.namaProduk == null
                                            ? Center()
                                            : Text(
                                                data.namaProduk,
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                maxLines: 3,
                                              )),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Row(
                                    children: <Widget>[
                                      data.jumlahProduk == null
                                          ? Center()
                                          : Text(
                                              data.jumlahProduk + " x ",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                      data.hargaProduk == null
                                          ? Center()
                                          : Text(
                                              "Rp. " + data.hargaProduk,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            )
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 90,
                                  child: data.totalHargaProduk == null
                                      ? Center()
                                      : Text(
                                          "Rp." + data.totalHargaProduk,
                                          style: TextStyle(
                                              color: Colors.green,
                                              fontSize: 15),
                                        ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ]))));
        });
  }
}

class RincianPage extends StatelessWidget {
  List list;
  RincianPage({this.list});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          print(list[index]['total_belanja']);
          return Container(
            child: Text(
              list[index]['total_belanja'] == null
                  ? "0"
                  : 'Rp. ${list[index]['total_belanja']}',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
            ),
          );
        });
  }
}
