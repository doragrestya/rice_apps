import 'package:flutter/material.dart';
import 'package:gorice/model/ModelOrder.dart';
import 'package:gorice/network/NetworkProvider.dart';
import 'package:gorice/ui_page/history/CompletePage.dart';
import 'package:gorice/ui_page/history/ListPesananPage.dart';
import 'package:gorice/ui_page/history/OrderPage.dart';
import 'package:gorice/ui_page/history/ProcessingPage.dart';
import 'package:gorice/utils/SessionManager.dart';
import 'package:intl/intl.dart';

class CancelPage extends StatefulWidget {
  TabController controller;
  CancelPage({this.controller});
  @override
  _CancelPageState createState() => _CancelPageState();
}

class _CancelPageState extends State<CancelPage> {
  BaseEndPoint network = NetworkProvider();
  String myId;
  SessionManager sm = SessionManager();

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        title: Text("History Order"),
//        backgroundColor: Colors.green[800],
//      ),
      body: ListView(
        children: <Widget>[
//          Container(
//            height: 100,
//            child: Padding(
//              padding: const EdgeInsets.only(left: 5.0, right: 5),
//              child: Row(
//                mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                children: <Widget>[
//                  Container(
//                    width: 80,
//                    child: RaisedButton(
//                      onPressed: () {
//                        Navigator.pushReplacement(
//                            context,
//                            MaterialPageRoute(
//                                builder: (context) => OrderPage()));
//                      },
//                      child: Text('Onho'),
//                      color: Colors.orange,
//                    ),
//                  ),
//                  Container(
//                    width: 70,
//                    child: RaisedButton(
//                      onPressed: () {
//                        Navigator.pushReplacement(
//                            context,
//                            MaterialPageRoute(
//                                builder: (context) => ProcessingPage()));
//                      },
//                      child: Text('Proc'),
//                      color: Colors.blue,
//                    ),
//                  ),
//                  Container(
//                    width: 70,
//                    child: RaisedButton(
//                      onPressed: () {
//                        Navigator.pushReplacement(
//                            context,
//                            MaterialPageRoute(
//                                builder: (context) => CompletePage()));
//                      },
//                      child: Text('Comp'),
//                      color: Colors.green,
//                    ),
//                  ),
//                  Container(
//                    width: 70,
//                    child: RaisedButton(
//                      onPressed: () {
//                        Navigator.pushReplacement(
//                            context,
//                            MaterialPageRoute(
//                                builder: (context) => CancelPage()));
//                      },
//                      child: Text('Canc'),
//                      color: Colors.red,
//                    ),
//                  ),
//                ],
//              ),
//            ),
//          ),
//          SizedBox(
//            height: 15,
//          ),
//          Center(
//            child: Text(
//              "{ BATAL }",
//              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//            ),
//          ),
          Container(
            height: MediaQuery.of(context).size.height / 1.5,
            child: FutureBuilder(
                future: network.getOrder(myId,"5"),
                builder: (context, result) {
                  if (result.hasError) print(result.error);
                  return result.hasData
                      ? ListCancelPage(list: result.data)
                      : Center(
                    child: Text('Data Kosong'),
                  );
                }),
          )
        ],
      ),
    );
  }
}

class ListCancelPage extends StatefulWidget {
  List list;
  ListCancelPage({this.list});
  @override
  _ListCancelPageState createState() => _ListCancelPageState();
}

class _ListCancelPageState extends State<ListCancelPage> {
  var dateFormate;
  BaseEndPoint network = NetworkProvider();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: widget.list.length,
        itemBuilder: (context, index) {
          DataOrder order = widget.list[index];
          dateFormate = DateFormat("dd MMM yyyy").format(order.tanggalOrder);
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: Colors.red,
              height: MediaQuery.of(context).size.height / 2.1,
              child: Card(
                elevation: 5,
                child: ListView(
                  children: <Widget>[
                    order.keterangan == null
                        ? ""
                        : Container(
                      height: 30,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.red[300],
                      child: Center(
                        child: Text(
                          order.keterangan,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                                padding: const EdgeInsets.only(left: 10, top: 10),
                                child: Text(
                                  dateFormate,
                                  style: TextStyle(
                                      fontSize: 15),
                                )),
                            order.idCheckout == null
                                ? 0
                                : Padding(
                              padding: const EdgeInsets.only(
                                  left: 10.0, top: 10),
                              child: Text(
                                order.idCheckout,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                            ),
                          ],
                        ),
//                        FlatButton(
//                          onPressed: () {
//                            Navigator.push(
//                                context,
//                                MaterialPageRoute(
//                                    builder: (context) => DetailCancelPage(
//                                        kode : order.idCheckout,
//                                        total : order.orderTotal,
//                                        payment : order.namaPayment
//                                    )));
//                          },
//                          child: Text(
//                            "Lihat Pesanan ",
//                            style: TextStyle(
//                                color: Colors.green[800], fontSize: 16),
//                          ),
//                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Container(
                        height: 3,
                        color: Colors.grey[200],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 20.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            height: 70,
                            width: 70,
                            color: Colors.grey[200],
                            child: Image.asset(
                              "images/user.png",
                            )
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              order.fullnameKonsumen == null
                                  ? ""
                                  : Padding(
                                padding:
                                const EdgeInsets.only(left: 20.0),
                                child: Text(
                                  order.fullnameKonsumen,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              order.emailKonsumen == null
                                  ? ""
                                  : Padding(
                                padding: const EdgeInsets.only(
                                    left: 20.0, top: 5),
                                child: Text(
                                  order.emailKonsumen,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              order.nohpKonsumen == null
                                  ? ""
                                  : Padding(
                                padding: const EdgeInsets.only(
                                    left: 20.0, top: 5),
                                child: Text(
                                  order.nohpKonsumen,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Container(
                        height: 3,
                        color: Colors.grey[200],
                      ),
                    ),
                    Padding(
                      padding:
                      const EdgeInsets.only(left: 10.0, top: 10, right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              order.namaPayment == null
                                  ? Center()
                                  : Text(order.namaPayment, style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14
                              ),),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Total Pembayaran',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 14),
                              ),

                              order.orderTotal == null
                                  ? Center()
                                  : Text(
                                "Rp. " + order.orderTotal,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red,
                                    fontSize: 14),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}


class DetailCancelPage extends StatefulWidget {
  String kode, total, payment;

  DetailCancelPage({this.kode, this.total, this.payment});
  @override
  _DetailCancelPageState createState() => _DetailCancelPageState();
}

class _DetailCancelPageState extends State<DetailCancelPage> {
  BaseEndPoint network = NetworkProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[800],
        title: Text("Order " + widget.kode),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 10),
            child: Text(
              'Daftar Pesanan',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: MediaQuery.of(context).size.height / 2,
              child: Card(
                elevation: 3,
                child: FutureBuilder(
                    future: network.getPesanan(widget.kode),
                    builder: (context, result) {
                      if (result.hasError) print(result.error);
                      return result.hasData
                          ? ListPesananPage(list: result.data)
                          : Center(
                        child: Text("0"),
                      );
                    }),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 10),
            child: Text(
              'Rincian Pembayaran',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: MediaQuery.of(context).size.height / 6,
              child: Card(
                elevation: 5,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding:
                      const EdgeInsets.only(left: 20.0, top: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Total Belanja",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          widget.total == null
                              ? Center()
                              : Text(
                            "Rp. " + widget.total,
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                      const EdgeInsets.only(left: 20.0, top: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Metode Pembayaran",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          widget.payment == null
                              ? Center()
                              : Text(
                            widget.payment,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

