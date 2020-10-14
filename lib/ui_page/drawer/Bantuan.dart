import 'package:flutter/material.dart';

class Bantuan extends StatefulWidget {
  @override
  _BantuanState createState() => _BantuanState();
}

class _BantuanState extends State<Bantuan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[800],
        title: Text('Panduan  Belanja', style: TextStyle(
            color: Colors.white
        ),),
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 35),
                      child: Center(
                        child: Row(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 2, right: 2),
                              alignment: Alignment.center,
                              height: 35,
                              width: 35,
                              color: Colors.green,
                              child: Text('P', style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 2, right: 2),
                              alignment: Alignment.center,
                              height: 35,
                              width: 35,
                              color: Colors.green,
                              child: Text('A', style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 2, right: 2),
                              alignment: Alignment.center,
                              height: 35,
                              width: 35,
                              color: Colors.green,
                              child: Text('N', style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 2, right: 2),
                              alignment: Alignment.center,
                              height: 35,
                              width: 35,
                              color: Colors.green,
                              child: Text('D', style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 2, right: 2),
                              alignment: Alignment.center,
                              height: 35,
                              width: 35,
                              color: Colors.green,
                              child: Text('U', style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 2, right: 2),
                              alignment: Alignment.center,
                              height: 35,
                              width: 35,
                              color: Colors.green,
                              child: Text('A', style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 2, right: 2),
                              alignment: Alignment.center,
                              height: 35,
                              width: 35,
                              color: Colors.green,
                              child: Text('N', style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 35),
                      child: Center(
                        child: Row(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 2, right: 2),
                              alignment: Alignment.center,
                              height: 35,
                              width: 35,
                              color: Colors.green,
                              child: Text('B', style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 2, right: 2),
                              alignment: Alignment.center,
                              height: 35,
                              width: 35,
                              color: Colors.green,
                              child: Text('E', style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 2, right: 2),
                              alignment: Alignment.center,
                              height: 35,
                              width: 35,
                              color: Colors.green,
                              child: Text('L', style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 2, right: 2),
                              alignment: Alignment.center,
                              height: 35,
                              width: 35,
                              color: Colors.green,
                              child: Text('A', style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 2, right: 2),
                              alignment: Alignment.center,
                              height: 35,
                              width: 35,
                              color: Colors.green,
                              child: Text('N', style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 2, right: 2),
                              alignment: Alignment.center,
                              height: 35,
                              width: 35,
                              color: Colors.green,
                              child: Text('J', style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 2, right: 2),
                              alignment: Alignment.center,
                              height: 35,
                              width: 35,
                              color: Colors.green,
                              child: Text('A', style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),),
                            ),
                          ],
                        ),
                      ),
                    ),
//                    Center(
//                      child: Text(
//                        'GORICE',
//                        style: TextStyle(
//                            fontSize: 16.0,
//                            fontWeight: FontWeight.bold,
//                            letterSpacing: 2,
//                            color: Colors.green[700]),
//                      ),
//                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, top: 30.0),
                      child: Text("1. Pada halaman Login, masukkan email dan password Anda", style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14
                      ), textAlign: TextAlign.justify,),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15, top: 3),
                      child: Text("2. Jika Anda belum memiliki akun, maka Sign Up terlebih dahulu pada halaman registrasi", style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14
                      ), textAlign: TextAlign.justify,),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15, top: 3),
                      child: Text("3. Pilih kategori produk yang Anda inginkan. Untuk mempermudah, silakan klik icon searching untuk mencari produk yang Anda inginkan", style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14
                      ), textAlign: TextAlign.justify,),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15, top: 3),
                      child: Text("4. Anda dapat mengklik tombol beli, untuk menambahkan produk ke dalam list keranjang Anda", style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14
                      ), textAlign: TextAlign.justify,),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15, top: 3),
                      child: Text("5. Untuk melihat detail produk yang akan dibeli, silahkan klik salah satu item produk, maka Anda akan diarahkan pada halaman detail produk tersebut", style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14
                      ), textAlign: TextAlign.justify,),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15, top: 3),
                      child: Text("6. Untuk melihat produk yang telah Anda beli, Silakan klik icon keranjang, maka Anda akan diarahkan pada halaman Keranjang", style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14
                      ), textAlign: TextAlign.justify,),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15, top: 3),
                      child: Text("7. Pada halaman keranjang terdapat beberapa list produk yang telah dipilih, kemudian klik tombol Checkout", style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14
                      ), textAlign: TextAlign.justify,),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15, top: 3),
                      child: Text("8. Setelah itu, Anda akan diarahkan pada halaman Checkout. Kemudian pada halaman ini pilih metode pembayaran dan mentode pengiriman yang akan Anda gunakan", style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14
                      ), textAlign: TextAlign.justify,),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15, top: 3),
                      child: Text("9. Klik tombol Checkout, pastikan Anda telah memilih metode pembayaran dan metode pembayaran. Maka Anda telah berhasil melakukan checkout pada Aplikasi GoRice", style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14
                      ), textAlign: TextAlign.justify,),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15, top: 3),
                      child: Text("10. Selanjutnya, jika Anda memilih metode pembayaran Bank Transfer maka silahkan Upload Bukti Transfer pada menu Konfirmasi Pembayaran", style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14
                      ), textAlign: TextAlign.justify,),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Center(
                        child: Text(
                            '"Selamat Berbelanja"',
                            style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold), textAlign: TextAlign.right,
                          ),
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

