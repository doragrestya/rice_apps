import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gorice/constant/ConstantFile.dart';
import 'package:gorice/model/ModelSlider.dart';
import 'package:gorice/network/NetworkProvider.dart';
import 'package:gorice/ui_page/home/KategoriPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  BaseEndPoint network = NetworkProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  child: FutureBuilder(
                    future: network.getSlider(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasError) print(snapshot.error);
                      List list = snapshot.data;
                      return snapshot.hasData
                          ? CarouselSlider.builder(
                              itemCount: list.length,
                              itemBuilder: (BuildContext context, index) {
                                Dataslider data = list[index];
                              print("MyData: ${data.imageSlider}");
                                return Container(
                                  height: MediaQuery.of(context).size.height,
                                  width: MediaQuery.of(context).size.width,
                                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                                  child: Image.network(
                                    ConstantFile().sliderUrl + data.imageSlider,
                                    fit: BoxFit.fill,
                                  ),
                                );
                              },
                              options: CarouselOptions(
                                  aspectRatio: 2.0,
                                  enlargeCenterPage: true,
                                  scrollDirection: Axis.horizontal,
                                  enableInfiniteScroll: false,
                                  autoPlay: true),
                            )
                          : Center(
                              child: CircularProgressIndicator(),
                            );
                    },
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 400,
              child: Card(
                color: Color(0xFFF7F7F7),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                elevation: 3.0,
                child: Column(
                  children: <Widget>[
                    FutureBuilder(
                        future: network.getKategori(""),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.hasError) print(snapshot.error);
                          return snapshot.hasData
                              ? KategoriPage(list: snapshot.data)
                              : Center(
                                  child: CircularProgressIndicator(),
                                );
                        }),
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
