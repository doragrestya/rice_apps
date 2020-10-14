import 'package:flutter/material.dart';
import 'package:gorice/constant/ConstantFile.dart';
import 'package:gorice/model/ModelKeranjang.dart';
import 'package:gorice/network/NetworkProvider.dart';
import 'package:gorice/ui_page/checkout/BuktiTransaksiPage.dart';


class ListPesananPage extends StatelessWidget {
  List list;
  ListPesananPage({this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: list.length,
        itemBuilder: (context, index) {
          DataKeranjang data = list[index];
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
