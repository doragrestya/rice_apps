import 'package:flutter/material.dart';
import 'package:gorice/model/ModelOrder.dart';
import 'package:gorice/network/NetworkProvider.dart';
import 'package:gorice/ui_page/DashboardPage.dart';
import 'package:gorice/utils/GenerateCode.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ResultPage extends StatefulWidget {
  String kode;
  ResultPage({this.kode});
  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  String globalCode;
  BaseEndPoint network = NetworkProvider();
  GenerateCode generateCode = GenerateCode();

  removeCode() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.remove("code");
    pref.commit();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DashboardPage()));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    generateCode.getCode().then((value) {
      setState(() {
        globalCode = generateCode.globalCode;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.green,
        child: ListView(
          children: <Widget>[
            Container(
              color: Colors.green,
              child: Padding(
                padding: const EdgeInsets.only(top: 100, left: 10, right: 10),
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 80,
                          width: 80,
                          child: Image(
                            image: AssetImage("images/berhasil.png"),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            'Selamat Anda telah melakukan pemesanan pada Aplikasi GoRice.',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue),
                            textAlign: TextAlign.center,
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(
                            left: 20,
                            right: 20,
                            top: 30,
                          ),
                          child: Center(
                            child: Stack(
                              children: <Widget>[
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 150,
                                  child: FutureBuilder(
                                      future: network.getDataOrder(globalCode, "2"),
                                      builder: (context, result) {
                                        if (result.hasError) print(result.error);
                                        return result.hasData
                                            ? ListDataOrder(list: result.data)
                                            : Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      }),
                                ),
                              ],
                            ),
                          ),
                        ),

                        Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              height: 50,
                              width: 150,
                              child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                color: Colors.green,
                                child: Text('Belanja Lagi', style: TextStyle(color: Colors.white, fontSize: 15),
                                ),
                                onPressed: (){
                                  removeCode();
                                },
                              ),
                            )
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class ListDataOrder extends StatelessWidget {
  List list;
  ListDataOrder({this.list});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: list.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          DataOrder dataOrder = list[index];
          return Center(
            child: Card(
              elevation: 12,
              child: Padding(
                padding: const EdgeInsets.only(left: 14, top: 10, right: 10),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text("Nama penerima  :  ", style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15
                          ),),
                          dataOrder.fullnameKonsumen == null ? Center() : Text(dataOrder.fullnameKonsumen, style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15
                          ))
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: <Widget>[
                          Text("Metode Pembayaran  :  ", style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15
                          )),
                          dataOrder.namaPayment == null ? Center() : Text(dataOrder.namaPayment, style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15
                          ))
                        ],
                      ),

                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: <Widget>[
                          Text("Rekening Tujuan  :  ", style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15
                          )),
                          dataOrder.noRek == Center() ? "" : Text(dataOrder.noRek, style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15
                          ))
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: <Widget>[
                          Text("Order Total  :  ", style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15
                          )),
                          dataOrder.orderTotal == null ? Center() : Text(dataOrder.orderTotal, style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15
                          ))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}