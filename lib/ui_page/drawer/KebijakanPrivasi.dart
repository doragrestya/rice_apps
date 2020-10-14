import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class KebijakanPrivasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kebijakan Privasi'),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                elevation: 5.0,
                child: ListView(
                  children: <Widget>[
                    Container(
                        height: MediaQuery.of(context).size.height / 5,
                        child: Image(
                          image: AssetImage("images/logo.png"), height: 100, width: 100,
                        )),
                    Padding(
                      padding:
                      const EdgeInsets.only(top: 10.0, left: 20, right: 20),
                      child: Text(
                        '"Adanya Kebijakan Privasi ini adalah komitmen nyata dari GoRice untuk menghargai dan melindungi setiap data atau informasi pribadi Pengguna situs www.GoRice.com, situs-situs turunannya, serta aplikasi gawai GoRice(selanjutnya disebut sebagai "Situs"). Kebijakan Privasi ini(beserta syarat-syarat penggunaan dari situs GoRice sebagaimana tercantum dalam "Syarat & Ketentuan" dan informasi lain yang tercantum di Situs) menetapkan dasar atas perolehan, pengumpulan, pengolahan, penganalisisan, penampilan, pembukaan,dan/atau segala bentuk pengelolaan yang terkait dengan data atau informasi yang Pengguna berikan kepada GoRice atau yang GoRice kumpulkan dari Pengguna, termasuk data pribadi Pengguna, baik pada saat Pengguna melakukan pendaftaran di Situs, mengakses Situs, maupun mempergunakan layanan-layanan pada Situs (selanjutnya disebut sebagai "data"). Dengan mengakses dan/atau mempergunakan layanan GoRice, Pengguna menyatakan bahwa setiap data Pengguna merupakan data yang benar dan sah, serta Pengguna memberikan persetujuan kepada GoRice untuk memperoleh dan mempergunakan data tersebut sebagaimana tercantum dalam Kebijakan Privasi maupun Syarat dan Ketentuan GoRice."',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40.0, bottom: 10.0),
                      child: Text(
                        'Gapoktan Baringin Saiyo',
                        style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold),textAlign: TextAlign.center,
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
