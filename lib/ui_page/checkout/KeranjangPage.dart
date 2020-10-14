import 'dart:convert';
import 'dart:math';
import 'package:gorice/model/ModelKeranjang.dart';
import 'package:gorice/ui_page/checkout/CheckOutPage.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:gorice/constant/ConstantFile.dart';
import 'package:gorice/network/NetworkProvider.dart';
import 'package:gorice/utils/GenerateCode.dart';
import 'package:gorice/utils/SessionManager.dart';

class KeranjangPage extends StatefulWidget {
  @override
  _KeranjangPageState createState() => _KeranjangPageState();
}

class _KeranjangPageState extends State<KeranjangPage> {
  String myId;
  String globalCode;
  BaseEndPoint network = NetworkProvider();
  SessionManager sm = SessionManager();
  GenerateCode generateCode = GenerateCode();



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sm.getPreference().then((value) {
      setState(() {
        myId = sm.globIduser;
      });
    });
    generateCode.getCode().then((value) {
      setState(() {
        globalCode = generateCode.globalCode;
      });
    });
  }

  var _chars = '1234567890';
  Random _random = Random();

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_random.nextInt(_chars.length))));

  getTotalBelanja(String idUser, String idStatus, String detailOrder) async {
    final response =
        await http.post(ConstantFile().baseUrl + "totalBelanja", body: {
      'id_user': idUser,
      'id_status_transaksi': idStatus,
      'detail_order': detailOrder,
    });
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Keranjang'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: network.getKeranjang(myId, "1"),
        builder: (context, result) {
          if (result.hasError) print(result.error);
          print(result.data);
          return result.hasData
              ? ListKeranjang(list: result.data)
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
      bottomNavigationBar: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Container(
              color: Colors.white,
              height: 100,
              width: MediaQuery.of(context).size.width/1.5,
              alignment: Alignment.bottomLeft,
              child: FutureBuilder(
                    future: getTotalBelanja(myId, "1", globalCode),
                    builder: (context, result) {
                      if (result.hasError) print(result.error);
                      return result.hasData
                          ? TotalBelanjaPage(list: result.data)
                          : Center(
                              child: CircularProgressIndicator(),
                            );
                    },
                  ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width / 3.3,
            height: 100,
            child: RaisedButton(
              color: Colors.green,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CheckOutPage()));
              },
              child: Text(
                'Checkout',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ListKeranjang extends StatefulWidget {
  List<DataKeranjang> list;
  ListKeranjang({this.list});
  @override
  _ListKeranjangState createState() => _ListKeranjangState();
}

class _ListKeranjangState extends State<ListKeranjang> {
  BaseEndPoint network = NetworkProvider();
  String myId, myEmail, myTelp, myName, myAlamat;
  String globalCode;

  SessionManager sm = SessionManager();
  GenerateCode gc = GenerateCode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sm.getPreference().then((value) {
      setState(() {
        myId = sm.globIduser;
      });
    });
    gc.getCode().then((value) {
      setState(() {
        globalCode = gc.globalCode;
      });
    });
  }

  var _chars = '1234567890';
  Random _random = Random();

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_random.nextInt(_chars.length))));

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: widget.list == null ? 0 : widget.list.length,
        itemBuilder: (context, index) {
          DataKeranjang data = widget.list[index];
          print(data.namaProduk);
          return Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                child: Card(
                  elevation: 3,
                  child: Row(
                    children: <Widget>[
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
                                    ConstantFile().imageUrl + data.gambarProduk,
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
                                                  fontWeight: FontWeight.bold),
                                              maxLines: 3,
                                            )),
                                  IconButton(
                                    icon: Icon(Icons.close),
                                    onPressed: ()async{
                                      network.deleteProdukKeranjang(data.idProduk);
                                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => KeranjangPage()));
                                      await network.getKeranjang(myId, "1");
                                    },
                                  )
                                ],
                              ),
                              Container(
                                width: 90,
                                child: data.totalHargaProduk == null
                                    ? Center()
                                    : Text(
                                        "Rp." + data.hargaProduk,
                                        style: TextStyle(
                                            color: Colors.green, fontSize: 15),
                                      ),
                              ),
                              Row(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(right: 5),
                                    child: IconButton(
                                      onPressed: () async {
                                        network.decrementCounter(
                                            myId, data.idProduk);
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    KeranjangPage()));
                                      },
                                      icon: Icon(
                                        Icons.indeterminate_check_box,
                                        size: 20,
                                        color: Colors.green,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 40,
                                    child: data.jumlahProduk == null
                                        ? Center()
                                        : Text(
                                            data.jumlahProduk,
                                            style: TextStyle(fontSize: 16),
                                            textAlign: TextAlign.center,
                                          ),
                                  ),
                                  data.jumlahProduk == data.stokProduk
                                      ? Center()
                                      : Padding(
                                          padding:
                                              const EdgeInsets.only(left: 5),
                                          child: IconButton(
                                            onPressed: () async {
                                              network.addUpdateTransaksi(
                                                  data.totalHargaProduk,
                                                  data.jumlahProduk,
                                                  data.idProduk,
                                                  myId,
                                                  globalCode);
                                              await network.getKeranjang(
                                                  myId, "1");
                                              Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          KeranjangPage()));
                                            },
                                            icon: Icon(
                                              Icons.add_box,
                                              size: 20,
                                              color: Colors.green,
                                            ),
                                          ),
                                        )
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ));
        });
  }
}

class TotalBelanjaPage extends StatelessWidget {
  List list;
  TotalBelanjaPage({this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(left: 8, top: 20),
            child: Row(
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Total Belanja',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      list[index]['total_belanja'] == null
                          ? "0"
                          : 'Rp. ${list[index]['total_belanja']}',
                      style: TextStyle(color: Colors.red, fontSize: 20),
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }
}
