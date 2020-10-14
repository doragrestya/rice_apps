import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gorice/constant/ConstantFile.dart';
import 'package:gorice/model/ModelKategori.dart';
import 'package:gorice/ui_page/home/ListVerticalKategori.dart';

class KategoriPage extends StatelessWidget {
  List list;
  String namaKategori;
  KategoriPage({this.list});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        itemCount: list.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
        itemBuilder: (BuildContext context, int index) {
          Kategori data = list[index];
          return Container(
              height: 15,
              width: 15,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ListVerticalKategori(
                                idKategori: data.idKategori,
                                namaKategori: data.namaKategori,
                              )));
                },
                child: Card(
                  margin: EdgeInsets.all(10),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Column(
                        children: <Widget>[
                          ClipRRect(
                            child: Image.network(
                              ConstantFile().iconUrl + data.iconKategori,
                              height: 60,
                              width: 80,
                              fit: BoxFit.fill,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            data.namaKategori,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ));
        });
  }
}
