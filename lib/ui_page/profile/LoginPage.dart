import 'package:flutter/material.dart';
import 'package:gorice/model/ModelKonsumen.dart';
import 'package:gorice/network/NetworkProvider.dart';
import 'package:gorice/ui_page/DashboardPage.dart';
import 'package:gorice/ui_page/profile/RegisterPage.dart';
import 'package:gorice/utils/SessionManager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

enum LoginStatus { notLogin, Login }

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> _key = GlobalKey();
  String myEmail, myPassword;
  BaseEndPoint network = NetworkProvider();
  var status = false;
  var globIduser, globName, globEmail, globPhoto, globNohp, globAlamat;
  var globStatus;
//  TextEditingController etEmail = TextEditingController();
//  TextEditingController etPassword = TextEditingController();
  var _obSecure = true;
  LoginStatus _loginStatus = LoginStatus.notLogin;

  void onHideSecure() {
    if (_obSecure == true) {
      setState(() {
        _obSecure = false;
      });
    } else {
      setState(() {
        _obSecure = true;
      });
    }
  }

  void alertLogin() {
    AlertDialog alertDialog = new AlertDialog(
      elevation: 24.0,
      content: new Container(
        height: 120.0,
        child: new Center(
          child: Column(
            children: <Widget>[
              Icon(
                Icons.warning,
                color: Colors.red,
                size: 50,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text(
                  "Pastikan email dan password Anda benar!",
                  style: TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
      actions: [
        FlatButton(
          child: Text('Back'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
    showDialog(
      context: context,
      child: alertDialog,
      barrierDismissible: true,
    );
  }

  void sentToDatabase() async {
    if (_key.currentState.validate()) {
      _key.currentState.save();
      if (myEmail.isEmpty || myPassword.isEmpty) {
        print("Form Tidak Boleh Kosong");
      } else {
        List listData =
            await network.loginKonsumen(myEmail, myPassword, context);

        if (listData == null) {
          alertLogin();
        } else {
          Konsuman data = listData[0];
          print(
              "myData : ${data.idKonsumen} ${data.fullnameKonsumen} ${data.emailKonsumen}");
          setState(() {
            status = true;
            savePreference(
                status,
                data.idKonsumen,
                data.fullnameKonsumen,
                data.emailKonsumen,
                data.photoKonsumen,
                data.nohpKonsumen,
                data.alamatKonsumen);
          });
        }
      }
    }
  }

//  void onValidate() async {
//      if (etEmail.text.isEmpty || etPassword.text.isEmpty) {
//        print('Gagal');
//        //      _showDialogError();
//      } else {
//        List listData = await network.loginKonsumen(
//            etEmail.text.toString(),
//            etPassword.text.toString(), context);
////        Navigator.pop(context);
//          Konsuman data = listData[0];
//          print(
//              "myData : ${data.idKonsumen} ${data.fullnameKonsumen} ${data.emailKonsumen}");
//          setState(() {
//            status = true;
//            savePreference(
//                status,
//                data.idKonsumen,
//                data.fullnameKonsumen,
//                data.emailKonsumen,
//                data.photoKonsumen,
//                data.nohpKonsumen,
//                data.alamatKonsumen);
//          });
//        }
//      }

  void savePreference(
      bool status,
      String idUser,
      String fullnameUser,
      String emailUser,
      String photoUser,
      String nohpUser,
      String alamatUser) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool("myStatus", status);
    sharedPreferences.setString("myIduser", idUser);
    sharedPreferences.setString("myName", fullnameUser);
    sharedPreferences.setString("myEmail", emailUser);
    sharedPreferences.setString("myTelp", nohpUser);
    sharedPreferences.setString("myPhoto", photoUser);
    sharedPreferences.setString("myAlamat", alamatUser);
    sharedPreferences.commit();
  }

  void getPreference() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    globStatus = sharedPreferences.getBool("myStatus");
    globIduser = sharedPreferences.get("myIduser");
    globName = sharedPreferences.getString("myName");
    globEmail = sharedPreferences.getString("myEmail");
    globPhoto = sharedPreferences.getString("myPhoto");
    globNohp = sharedPreferences.getString("myTelp");
    globAlamat = sharedPreferences.getString("myAlamat");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPreference();
  }

//  void _showDialogError() {
//    showDialog(
//        context: context,
//        builder: (BuildContext context) {
//          return AlertDialog(
//            title: Text("Attention !!"),
//            content: Text("Please Check Your Email And Password"),
//            actions: <Widget>[
//              new FlatButton(
//                onPressed: () {
//                  Navigator.pop(context);
//                },
//                child: Text("Dissmiss"),
//              )
//            ],
//          );
//        });
//  }

//  void showSnackbar(String title) {
//    final snackbar = SnackBar(
//      content: Text("$title"),
//    );
//    scaffoldKey.currentState.showSnackBar(snackbar);
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Padding(
        padding: const EdgeInsets.only(top: 90),
        child: Center(
          child: ListView(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(30),
                padding:
                    EdgeInsets.only(top: 32, right: 16, left: 16, bottom: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Form(
                  key: _key,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Center(
                          child: Column(
                        children: <Widget>[
                          Image.asset(
                            'images/logo.png',
                            height: 120,
                            width: 120,
                          ),
                          Text('RICE APPS', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 20),)
                        ],
                      )),
                      SizedBox(
                        height: 27,
                      ),
                      TextFormField(
                        onSaved: (value) {
                          myEmail = value;
                        },
                        decoration: InputDecoration(hintText: 'Email Address'),
                      ),
                      TextFormField(
                        onSaved: (value) {
                          myPassword = value;
                        },
                        obscureText: _obSecure,
                        decoration: InputDecoration(
                            hintText: 'Password',
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obSecure
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                size: 25,
                              ),
                              onPressed: () {
                                onHideSecure();
                              },
                            )),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 16, bottom: 16),
                        width: MediaQuery.of(context).size.width,
                        height: 40,
                        child: RaisedButton(
                          color: Colors.green,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          onPressed: () {
                            sentToDatabase();
                          },
                          child: Text(
                            'Login',
                            style: TextStyle(
                                color: Colors.white, letterSpacing: 3),
                          ),
                        ),
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width,
                          child: FlatButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => RegisterPage()));
                            },
                            child: Text(
                              'Already have an Account? Sign Up',
                              style: TextStyle(color: Colors.blue),
                            ),
                          ))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
