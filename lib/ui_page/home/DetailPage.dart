import 'dart:math';
import 'package:flutter/material.dart';
import 'package:gorice/constant/ConstantFile.dart';
import 'package:gorice/network/NetworkProvider.dart';
import 'package:gorice/ui_page/checkout/KeranjangPage.dart';
import 'package:gorice/utils/GenerateCode.dart';
import 'package:gorice/utils/SessionManager.dart';

class DetailPage extends StatefulWidget {
  String id,nama, kategori, harga, stok, detail, gambar, idkategori, idproduk;
  DetailPage({this.id,this.nama, this.harga, this.kategori, this.stok, this.detail, this.gambar, this.idkategori, this.idproduk});
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  String myId, myEmail, myName, myPhoto;
  String globalCode;
  SessionManager sessionManager = SessionManager();
  BaseEndPoint network = NetworkProvider();

  void alertAdd(){
    AlertDialog alertDialog = AlertDialog(
      content: Container(
        height: 50.0,
        child: Center(
          child: Text("Produk berhasil ditambahkan"),
        ),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text('Close'),
          onPressed: (){
            Navigator.of(context).pop();
          },
        ),
        FlatButton(
          child: Text('Lihat'),
          onPressed: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => KeranjangPage()));
          },
        )
      ],
    );
    showDialog(context: context, child: alertDialog, barrierDismissible: true);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sessionManager.getPreference().then((value) {
      setState(() {
        myId = sessionManager.globIduser;
        myName = sessionManager.globName;
        myEmail = sessionManager.globEmail;
//        myPhoto = sessionManager.globPhoto;
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

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(length, (_) => _chars.codeUnitAt(_random.nextInt(_chars.length))));

  GenerateCode generateCode = GenerateCode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text(
          'Detail Produk',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        )
      ),
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Card(
                child: Container(
                  height: MediaQuery.of(context).size.height / 3,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              ConstantFile().imageUrl + widget.gambar),
                          fit: BoxFit.fill)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 250, left: 5, right: 5),
                child: Container(
                  color: Colors.white,
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    margin: EdgeInsets.all(16),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          widget.nama,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 15),
                        ),
                        Text(
                          'Rp. ${widget.harga}/kg',
                          style: TextStyle(
                              fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 350, left: 5, right: 5, bottom: 5),
                child: Container(
                  color: Colors.white,
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    margin: EdgeInsets.all(16),
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      'Informasi Barang',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 400, left: 5, right: 5),
                child: Container(
                  color: Colors.white,
                  height: 35,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 5, left: 15),
                              child: Text(
                                'Kategori',
                                style: new TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5, left: 65),
                              child: Text(widget.kategori, style: TextStyle(fontSize: 14),)
                            )
                          ],
                        ),
                      ),
                      VerticalDivider(
                        color: Colors.black12,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5, right: 5),
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Text(
                                'Stok',
                                style: new TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14),
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.only(top: 5, left: 30),
                                child: widget.stok == "0" ? Text('Sold Out', style: TextStyle(color: Colors.red, fontSize: 14),) :
                                Text(widget.stok, style: TextStyle(fontSize: 14),)
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Divider(
                color: Colors.black12,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 450),
                child: Container(
                  color: Colors.white,
                  height: MediaQuery.of(context).size.height / 4,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 15, right: 15, top: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 15, right: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      'Deskripsi',
                                      style: new TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.justify,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      widget.detail,
                                      style: new TextStyle(
                                        fontSize: 16,
                                      ),
                                      textAlign: TextAlign.justify,
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
