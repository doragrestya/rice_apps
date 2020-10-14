import 'package:flutter/material.dart';
import 'package:gorice/model/ModelJumlahKeranjang.dart';
import 'package:gorice/network/NetworkProvider.dart';
import 'package:gorice/ui_page/checkout/KeranjangPage.dart';
import 'package:gorice/ui_page/history/OrderPage.dart';
import 'package:gorice/ui_page/search/SearchPage.dart';
import 'package:gorice/utils/SessionManager.dart';
import 'package:gorice/ui_page/history/ProcessingPage.dart' as pro;
import 'package:gorice/ui_page/history/CompletePage.dart' as comp;
import 'package:gorice/ui_page/history/OrderPage.dart' as onho;
import 'package:gorice/ui_page/history/CancelPage.dart' as cancel;

class DashboardHistory extends StatefulWidget {
  List list;
  DashboardHistory({this.list});
  @override
  _DashboardHistoryState createState() => _DashboardHistoryState();
}

class _DashboardHistoryState extends State<DashboardHistory>
    with SingleTickerProviderStateMixin {
  TabController controller;
  BaseEndPoint network = NetworkProvider();
  String myId;
  SessionManager sm = SessionManager();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TabController(vsync: this, length: 4);
    setState(() {
      myId = sm.globIduser;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History Order'),
        iconTheme: IconThemeData(color: Colors.green),
        bottom: TabBar(
          controller: controller,
          tabs: <Widget>[
            Tab(
              icon: Icon(Icons.shopping_basket, color: Colors.white,),
              text: "Belum dibayar"
            ),
            Tab(
              icon: Icon(Icons.airport_shuttle, color: Colors.white,),
              text: "Process",
            ),
            Tab(
              icon: Icon(Icons.check_circle, color: Colors.white,),
              text: "Selesai",
            ),
            Tab(
              icon: Icon(Icons.cancel, color: Colors.white,),
              text: "Batal",
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: <Widget>[
          onho.OrderPage(),
          pro.ProcessingPage(),
          comp.CompletePage(),
          cancel.CancelPage()
        ],
      ),
    );
  }
}

class ListJumlahKeranjang extends StatelessWidget {
  List list;
  ListJumlahKeranjang({this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: list.length == null ? 0 : list.length,
        itemBuilder: (context, index) {
          Jumlahkeranjang data = list[index];
          return Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 22.0),
                child: Icon(
                  Icons.brightness_1,
                  size: 25,
                  color: Colors.red,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 29.0, top: 4),
                child: data.jumlah == null ? Text('0') : Text(data.jumlah),
              )
            ],
          );
        });
  }
}
