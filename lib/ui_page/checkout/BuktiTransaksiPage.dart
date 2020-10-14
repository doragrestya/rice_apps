import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gorice/network/NetworkProvider.dart';
import 'package:gorice/ui_page/DashboardPage.dart';
import 'package:gorice/ui_page/checkout/ResultPage.dart';
import 'package:gorice/utils/SessionManager.dart';
import 'package:image_picker/image_picker.dart';

class BuktiTransaksiPage extends StatefulWidget {
  @override
  _BuktiTransaksiPageState createState() => _BuktiTransaksiPageState();
}

class _BuktiTransaksiPageState extends State<BuktiTransaksiPage> {
  File _image;
  BaseEndPoint network = NetworkProvider();
  SessionManager sm = SessionManager();
  String myId;
  final formKey = GlobalKey<FormState>(); //Key untuk validate form

  TextEditingController kode = TextEditingController();
  TextEditingController nama = TextEditingController();
  TextEditingController notelp = TextEditingController();
  TextEditingController jumlah = TextEditingController();

  Future getImage(ImageSource media) async {
    var img = await ImagePicker.pickImage(source: media);
    setState(() {
      _image = img;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sm.getPreference().then((value) {
      setState(() {
        myId = sm.globIduser;
      });
    });
  }

  void myAlert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: Text('Please choose media to select'),
            content: Container(
              height: MediaQuery.of(context).size.height / 6,
              child: Column(
                children: <Widget>[
                  FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.gallery);
                    },
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.image),
                        Text('From Gallery')
                      ],
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.camera);
                    },
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.camera),
                        Text('From Camera'),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  void uploadBukti() {
    AlertDialog alertDialog = new AlertDialog(
      elevation: 24.0,
      shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
      content: new Container(
        height: 170.0,
        child: new Center(
          child: Column(
            children: <Widget>[
              Image.asset("images/konfirmasi.png", height: 100, width: 100,),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text("Konfirmasi Pembayaran Berhasil, TERIMA KASIH", textAlign: TextAlign.center,),
              ),
            ],
          ),
        ),
      ),
      actions: [
        FlatButton(
          child: Text('Kembali Belanja'),
          onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DashboardPage()));
          },
        ),
      ],
    );
    showDialog(context: context, child: alertDialog, barrierDismissible: true,);
  }

  void onValidate(){
    if(kode.text.isEmpty || nama.text.isEmpty || notelp.text.isEmpty || jumlah.text.isEmpty){
      print("Form Tidak Boleh Kosong");
    }
    else{
      network.uploadBukti(kode.text.toString(), nama.text.toString(), notelp.text.toString(), jumlah.text.toString(), _image);
      network.updateOrderStatus(kode.text.toString());
      uploadBukti();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Text('Bukti Transaksi'),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
            Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Card(
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Card(
                              color: Colors.green,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("** Silakan isi data dibawah ini sesuai dengan bukti transaksi", style: TextStyle(color: Colors.red),),
                                )),
                            SizedBox(
                              height: 25,
                            ),
                            TextFormField(
                              controller: kode,
                              decoration: InputDecoration(hintText: 'Kode Order'),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: nama,
                              decoration: InputDecoration(hintText: 'Nama Lengkap'),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: notelp,
                              decoration: InputDecoration(hintText: 'No. Telp'),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: jumlah,
                              decoration: InputDecoration(hintText: 'Jumlah Transfer'),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Padding(
                                padding: const EdgeInsets.all(16),
                                child: _image == null
                                    ? GestureDetector(
                                  onTap: () {
                                    myAlert();
                                  },
                                  child: Container(
                                    height: 75,
                                    width: MediaQuery.of(context).size.width,
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                          child: Icon(
                                            Icons.file_upload,
                                            size: 50,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 10),
                                          child: Text('Upload Bukti Pembayaran', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.red),),
                                        ),
                                      ],
                                    ),


                                  ),
                                )
                                    : ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.file(
                                    _image,
                                    fit: BoxFit.fill,
                                    width: MediaQuery.of(context).size.width,
                                    height:
                                    MediaQuery.of(context).size.height/10,
                                  ),
                                )),

                            Container(
                              margin: EdgeInsets.only(top: 16, bottom: 16),
                              width: MediaQuery.of(context).size.width,
                              height: 40,
                              child: RaisedButton(
                                color: Colors.green,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                onPressed: () {
                                  onValidate();
                                },
                                child: Text(
                                  'Konfirmasi Pembayaran',
                                  style:
                                  TextStyle(color: Colors.white, letterSpacing: 3),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )
        ],
      )

    );
  }
}
