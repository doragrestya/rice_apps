import 'dart:math';
import 'package:flutter/material.dart';
import 'package:gorice/constant/ConstantFile.dart';
import 'package:gorice/model/ModelProduk.dart';
import 'package:gorice/model/ModelProdukKategori.dart';
import 'package:gorice/network/NetworkProvider.dart';
import 'package:gorice/ui_page/DashboardPage.dart';
import 'package:gorice/ui_page/checkout/KeranjangPage.dart';
import 'package:gorice/ui_page/home/DetailPage.dart';
import 'package:gorice/ui_page/search/SearchPage.dart';
import 'package:gorice/utils/GenerateCode.dart';
import 'package:gorice/utils/SessionManager.dart';

class ListVerticalKategori extends StatefulWidget {
  String idKategori, namaKategori;
  ListVerticalKategori({this.idKategori, this.namaKategori});
  @override
  _ListVerticalKategoriState createState() => _ListVerticalKategoriState();
}

class _ListVerticalKategoriState extends State<ListVerticalKategori> {
  String myId, myEmail;

  BaseEndPoint network = NetworkProvider();
  SessionManager sessionManager = SessionManager();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    sessionManager.getPreference().then((value) {
      setState(() {
        myId = sessionManager.globIduser;
        myEmail = sessionManager.globEmail;
      });
    });
    print(widget.namaKategori);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            widget.namaKategori == null ? Center() : Text(widget.namaKategori),
        backgroundColor: Colors.green[800],
        actions: <Widget>[
          Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 5.0, top: 4),
                child: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => KeranjangPage()));
                  },
                  icon: Icon(Icons.shopping_cart),
                  color: Colors.white,
                ),
              ),
              Container(
                height: 30,
                width: 30,
                child: FutureBuilder(
                    future: network.getJumlahKeranjang(myId, "1"),
                    builder: (context, result) {
                      if (result.hasError) print(result.error);
                      return result.hasData
                          ? ListJumlahKeranjang(list: result.data)
                          : Center(
                              child: Text("0"),
                            );
                    }),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 5.0),
            child: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SearchPage()));
              },
              icon: Icon(Icons.search),
              color: Colors.white,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            child: FutureBuilder(
                future: network.getProdukKategori(widget.idKategori),
                builder: (context, result) {
                  if (result.hasError) print(result.error);
                  return result.hasData
                      ? ProdukListPage(list: result.data)
                      : Center(
                          child: Text("Data Kosong"),
                        );
                }),
          ),
        ],
      ),
    );
  }
}

class ProdukListPage extends StatefulWidget {
  List list;
  ProdukListPage({this.list});
  @override
  _ProdukListPageState createState() => _ProdukListPageState();
}

class _ProdukListPageState extends State<ProdukListPage> {
  String myId, myFullname, myEmail, myAlamat, myTelp;
  String globalCode;
  BaseEndPoint network = NetworkProvider();
  bool isLoading = true;

  SessionManager sessionManager = SessionManager();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sessionManager.getPreference().then((value) {
      setState(() {
        myId = sessionManager.globIduser;
      });
    });
    generateCode.getCode().then((value) {
      setState(() {
        globalCode = generateCode.globalCode;
      });
    });
  }

  var _chars = '1234567890';
  Random _rnd = Random();

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

  GenerateCode generateCode = GenerateCode();

  void alertTambahProduk() {
    AlertDialog alertDialog = new AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      content: new Container(
          margin: EdgeInsets.symmetric(vertical: 24),
          child: new Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Produk Berhasil ditambahkan",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              Container(
                margin: EdgeInsets.only(top: 32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      height: 45,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        textColor: Colors.white,
                        color: Colors.green,
                        child: Text("Lihat"),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => KeranjangPage()));
                        },
                      ),
                    ),
                    Container(
                      height: 45,
                      child: OutlineButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        focusColor: Colors.green,
                        textColor: Colors.green,
                        borderSide: BorderSide(color: Colors.green),
                        child: Text("Tutup"),
                        onPressed: (){
                          Navigator.pop(context);
                        },
                      ),
                    )
                  ],
                ),
              )
            ],
          )),
    );
    showDialog(
      context: context,
      child: alertDialog,
      barrierDismissible: true,
    );
  }

  void alertSoldOut() {
    AlertDialog alertDialog = new AlertDialog(
      elevation: 24.0,
      content: new Container(
        height: 150.0,
        child: new Center(
          child: Column(
            children: <Widget>[
              Icon(
                Icons.not_interested,
                color: Colors.red,
                size: 100,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text("Produk Sold Out"),
              ),
            ],
          ),
        ),
      ),
      actions: [
        FlatButton(
          child: Text('Belanja Kembali'),
          onPressed: () {
            Navigator.of(context).pop();
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
    return GridView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: NeverScrollableScrollPhysics(),
      itemCount: widget.list.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 0.55),
      itemBuilder: (BuildContext context, int index) {
        Kategoriproduk data = widget.list[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailPage(
                        nama: data.namaProduk,
                        harga: data.hargaProduk,
                        stok: data.stokProduk,
                        detail: data.detailProduk,
                        gambar: data.gambarProduk,
                        kategori: data.namaKategori,
                        idkategori: data.idKategori,
                        idproduk: data.idProduk)));
          },
          child: Card(
            elevation: 2,
            child: ListView(
              children: <Widget>[
                Container(
                  height: 140,
                  width: MediaQuery.of(context).size.width,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        ConstantFile().imageUrl + data.gambarProduk,
                        fit: BoxFit.cover,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, top: 10),
                  child: Container(
                    height: 30,
                    child: Text(
                      data.namaProduk,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16.0),
                      maxLines: 2,
                    ),
                  ),
                ),
                data.stokProduk == "0"
                    ? Padding(
                        padding: const EdgeInsets.only(left: 10.0, bottom: 4, top: 10),
                        child: Text(
                            "Sold Out",
                            style: TextStyle(
                              color: Colors.white, fontSize: 14, backgroundColor: Colors.red,
                            ),
                          ),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(left: 10.0, top: 10),
                        child:  Text(
                            'Available', style: TextStyle(color: Colors.white, fontSize: 14, backgroundColor: Colors.blue),
                          ),
                      ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "Rp. " + data.hargaProduk,
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold),
                  ),
                ),
                data.stokProduk == "0"
                    ? Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                        child: Center(
                          child: Container(
                            width: 150,
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0)),
                              onPressed: () {
                                alertSoldOut();
                              },
                              child: Text(
                                'BELI',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Center(
                          child: Container(
                            width: 150,
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              onPressed: () {
                                if (globalCode == null) {
                                  globalCode = getRandomString(5);
                                  print(globalCode);
                                  generateCode.saveData(globalCode);
                                  network.addUpdateTransaksi(data.hargaProduk,
                                      "1", data.idProduk, myId, globalCode);
                                  alertTambahProduk();
                                  network.getJumlahKeranjang(myId, "1");
                                  print(data.namaProduk);
                                } else {
                                  network.addUpdateTransaksi(data.hargaProduk,
                                      "1", data.idProduk, myId, globalCode);
                                  alertTambahProduk();
                                  network.getJumlahKeranjang(myId, "1");
                                }
                                /*network.addUpdateTransaksi(
                                data.harga, "1", data.idProduk, myId, getRandomString(4));
                            alertTambahProduk();*/
                              },
                              child: Text(
                                'BELI',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              color: Colors.green,
                            ),
                          ),
                        ),
                      )
              ],
            ),
          ),
        );
      },
    );
  }
}
