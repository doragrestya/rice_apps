import 'package:flutter/material.dart';
import 'package:gorice/model/ModelJumlahKeranjang.dart';
import 'package:gorice/network/NetworkProvider.dart';
import 'package:gorice/ui_page/checkout/BuktiTransaksiPage.dart';
import 'package:gorice/ui_page/checkout/KeranjangPage.dart';
import 'package:gorice/ui_page/drawer/AboutUs.dart';
import 'package:gorice/ui_page/drawer/Bantuan.dart';
import 'package:gorice/ui_page/drawer/KebijakanPrivasi.dart';
import 'package:gorice/ui_page/history/DashboardHistory.dart';
import 'package:gorice/ui_page/home/HomePage.dart';
import 'package:gorice/ui_page/profile/LoginPage.dart';
import 'package:gorice/ui_page/profile/Profile.dart';
import 'package:gorice/ui_page/search/SearchPage.dart';
import 'package:gorice/utils/SessionManager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage>
    with SingleTickerProviderStateMixin {
  String myId, myNama, myAlamat, myEmail, myPhoto;
  TabController controllerTab;
  int _selectedDrawerIndex = 0;
  SessionManager sessionManager = SessionManager();
  BaseEndPoint network = NetworkProvider();

  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).pop();
  }

  void signOut() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
    sharedPreferences.commit();
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
        (Route<dynamic> route) => false);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controllerTab = TabController(vsync: this, length: 3);
    sessionManager.getPreference().then((value) {
      setState(() {
        myId = sessionManager.globIduser;
        myNama = sessionManager.globName;
        myEmail = sessionManager.globEmail;
//        myPhoto = sessionManager.globPhoto;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controllerTab.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Theme(
        data: Theme.of(context).copyWith(
            backgroundColor: Colors.green,
            iconTheme: IconThemeData(color: Colors.white)),
        child: Drawer(
          child: new Column(
            children: <Widget>[
              new UserAccountsDrawerHeader(
                accountName: myNama == null
                    ? Center()
                    : Text(
                        myNama,
                      ),
                accountEmail: myEmail == null ? Center() : Text(myEmail),
                currentAccountPicture: CircleAvatar(
                    backgroundColor:
                        Theme.of(context).platform == TargetPlatform.iOS
                            ? Colors.green
                            : Colors.white,
                    child: Image.asset(
                      "images/user.png",
                      height: 100,
                      width: 100,
                    )
//                  Text(
//                    "GO",
//                    style: TextStyle(
//                        fontSize: 40.0,
//                        color: Colors.green,
//                        fontWeight: FontWeight.bold),
//                  ),
                    ),
                otherAccountsPictures: <Widget>[
                  CircleAvatar(
                      backgroundColor:
                          Theme.of(context).platform == TargetPlatform.iOS
                              ? Colors.green
                              : Colors.white,
                      child: IconButton(
                        icon: Icon(
                          Icons.exit_to_app,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          signOut();
                        },
                      ))
                ],
              ),
              ListTile(
                title: Text('Home'),
                leading: Icon(Icons.dashboard),
                trailing: Icon(Icons.arrow_right),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DashboardPage()));
                },
              ),
              ListTile(
                title: Text('Pembayaran'),
                leading: Icon(Icons.payment),
                trailing: Icon(Icons.arrow_right),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BuktiTransaksiPage()));
                },
              ),
              ListTile(
                title: Text('Tentang Aplikasi'),
                leading: Icon(Icons.info),
                trailing: Icon(Icons.arrow_right),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AboutUs()));
                },
              ),
              ListTile(
                title: Text('Panduan Belanja'),
                leading: Icon(Icons.help),
                trailing: Icon(Icons.arrow_right),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Bantuan()));
                },
              ),
              ListTile(
                title: Text('Kebijakan Privasi'),
                leading: Icon(Icons.report),
                trailing: Icon(Icons.arrow_right),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => KebijakanPrivasi()));
                },
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
          backgroundColor: Colors.green,
          actions: <Widget>[
            Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 5, top: 4),
                  child: IconButton(
                    tooltip: "Keranjang",
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
              padding: const EdgeInsets.only(right: 15.0),
              child: IconButton(
                tooltip: "Cari Produk",
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SearchPage()));
                },
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
              ),
            )
          ],
          title: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'TANI SOLOK',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 3,
                      fontSize: 26),
                )
              ],
            ),
          )),
      body: TabBarView(
        controller: controllerTab,
        children: <Widget>[HomePage(), Profile(), DashboardHistory()],
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 32,
        color: Colors.green,
        shape: CircularNotchedRectangle(),
        child: TabBar(
          controller: controllerTab,
          unselectedLabelColor: Colors.white,
          indicatorColor: Colors.white,
          labelColor: Colors.white60,
          tabs: <Widget>[
            Tab(icon: Icon(Icons.dashboard)),
            Padding(
              padding: const EdgeInsets.only(right: 30),
              child: Tab(
                icon: Icon(Icons.person),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 30),
              child: Tab(
                icon: Icon(Icons.bookmark),
              ),
            ),
          ],
        ),
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
