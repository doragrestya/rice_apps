import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tentang Aplikasi'),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height:  MediaQuery.of(context).size.height,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                elevation: 5.0,
                child: Column(
                  children: <Widget>[
                    Container(
                        height: MediaQuery.of(context).size.height / 5,
                        child: Image(
                          image: AssetImage("images/logo.png"), height: 100, width: 100,
                        )),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20.0, left: 20, right: 20),
                      child: Text(
                        '"Aplikasi GoRice berkerja sama dengan kelompok gabungan tani Baringan Saiyo yang berada di Kabupaten Solok. Kami menjual berbagai hasil pertanian yang dibutuhkan oleh para konsumen yang didapatkan langsung dari petani. Aplikasi ini hadir untuk membantu  meningkatkan kesejahteraan para petani"',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40.0),
                      child: Text(
                        'Gapoktan Baringin Saiyo',
                        style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold),
                      ),
                    )
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
