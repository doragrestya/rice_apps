import 'package:flutter/material.dart';
import 'package:gorice/network/NetworkProvider.dart';
import 'package:gorice/ui_page/profile/LoginPage.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  GlobalKey<FormState> _key = GlobalKey();
  String myName, myEmail, myPassword, myTelp, myAlamat;
  BaseEndPoint network = NetworkProvider();
  var _obSecure = true;

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

  void sentToDatabase(){
    if(_key.currentState.validate()){
      _key.currentState.save();
      if(myName.isEmpty || myEmail.isEmpty || myTelp.isEmpty || myAlamat.isEmpty || myPassword.isEmpty){
        print('Form Tidak Boleh Kosong!');
      } else {
        network.registerKonsumen(myName, myEmail,myTelp, myAlamat, myPassword, context);
      }
    } else {
      print('Not Validate');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(32),
              padding:
              EdgeInsets.only(top: 32, left: 16, right: 16, bottom: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Form(
                key: _key,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Register',
                      style: TextStyle(color: Colors.black, fontSize: 24),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Text(
                      'Lets get \nyou on board',
                      style: TextStyle(fontSize: 20, color: Colors.grey),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    TextFormField(
                      decoration: InputDecoration(hintText: 'Full Name'),
                      onSaved: (value){
                        myName = value;
                      },
                    ),

                    TextFormField(
                      decoration: InputDecoration(hintText: 'Email'),
                      onSaved: (value){
                        myEmail = value;
                      },
                    ),

                    TextFormField(
                      decoration: InputDecoration(hintText: 'No. Telepon'),
                      onSaved: (value){
                        myTelp = value;
                      },
                    ),

                    TextFormField(
                      decoration: InputDecoration(hintText: 'Alamat'),
                      onSaved: (value){
                        myAlamat = value;
                      },
                    ),

                    TextFormField(
                      obscureText: _obSecure,
                      onSaved: (value){
                        myPassword = value;
                      },
                      decoration: InputDecoration(
                        hintText: 'Password',
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obSecure ? Icons.visibility : Icons.visibility_off,
                            size: 25,
                          ),
                          onPressed: () {
                            onHideSecure();
                          },
                        )
                      ),
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
                        child: Text('Register',
                          style: TextStyle(color: Colors.white, letterSpacing: 3),
                        ),
                      ),
                    ),

                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: FlatButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Already have an Account? Sign In',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
