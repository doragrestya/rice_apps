import 'package:flutter/material.dart';
import 'package:gorice/ui_page/profile/Update.dart';
import 'package:gorice/utils/SessionManager.dart';
import 'package:gorice/constant/ConstantFile.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String myId, myEmail, myName, myPhoto, myTelp, myAlamat;
  SessionManager sessionManager = SessionManager();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sessionManager.getPreference().then((value) {
      setState(() {
        myId = sessionManager.globIduser;
        myEmail = sessionManager.globEmail;
        myName = sessionManager.globName;
        myPhoto = sessionManager.globPhoto;
        myTelp = sessionManager.globNohp;
        myAlamat = sessionManager.globAlamat;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Stack(
          children: <Widget>[
            Container(
              color: Colors.greenAccent,
              height: MediaQuery.of(context).size.height/3,
              width: MediaQuery.of(context).size.width,
            ),
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 32),
                    width: 180,
                    height: 180,
                    child: Image.asset("images/user.png"),
//                    CircleAvatar(
//                      radius: 100,
//                      child: ClipRRect(
//                        borderRadius: BorderRadius.circular(100),
//                        child: myPhoto == null
//                            ? Center()
//                            : Image.network(
//                          ConstantFile().imageUrl + myPhoto,
//                          fit: BoxFit.fill,
//                          width: 120,
//                          height: 120,
//                        ),
//                      ),
//                    ),
                  ),
//                  Container(
//                    margin: EdgeInsets.only(left: 32, right: 32),
//                    width: MediaQuery.of(context).size.width,
//                    height: MediaQuery.of(context).size.height / 6,
//
//                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Hai, ' + myName == null ? "" : myName,
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.green),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 16, right: 16),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          leading: Icon(
                            Icons.email,
                            color: Colors.blue,
                            size: 45,
                          ),
                          title: Text(
                            myEmail == null ? "" : myEmail,
                            style: TextStyle(fontSize: 20),
                          ),
                        ),

                        ListTile(
                          leading: Icon(
                            Icons.phone,
                            color: Colors.orange,
                            size: 45,
                          ),
                          title: Text(
                            myTelp == null ? "" : myTelp,
                            style: TextStyle(fontSize: 20),
                          ),
                        ),

                        ListTile(
                          leading: Icon(
                            Icons.location_on,
                            color: Colors.red,
                            size: 45,
                          ),
                          title: Text(
                            myAlamat == null ? "" : myAlamat,
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  ),
//                  Padding(
//                    padding: const EdgeInsets.all(16.0),
//                    child: SizedBox(
//                      width: MediaQuery.of(context).size.width,
//                      child: RaisedButton(
//                        color: Colors.green,
//                        child: Text(
//                          "Update Profile",
//                          style: TextStyle(color: Colors.white),
//                        ),
//                        onPressed: () {
//                          Navigator.push(
//                              context,
//                              MaterialPageRoute(
//                                  builder: (context) => Update(
//                                      id: myId,
//                                      name: myName,
//                                      email: myEmail,
//                                      photo: myPhoto,
//                                      nohp: myTelp,
//                                      alamat: myAlamat
//                                  )));
//                        },
//                      ),
//                    ),
//                  )
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
