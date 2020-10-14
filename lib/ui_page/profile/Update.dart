import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gorice/network/NetworkProvider.dart';
import 'package:gorice/ui_page/DashboardPage.dart';
import 'package:gorice/utils/SessionManager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;

class Update extends StatefulWidget {
  String id, name, email, photo, nohp, alamat;
  Update({this.id, this.name, this.email, this.photo, this.nohp, this.alamat});

  @override
  _UpdateState createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
  TextEditingController etName;
  TextEditingController etEmail;
  TextEditingController etNohp;
  TextEditingController etAlamat;
  File _image;
  final picker = ImagePicker();

  SessionManager sessionManager = SessionManager();
  BaseEndPoint network = NetworkProvider();

  void myAlert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: Text('Please choose media to select'),
            content: Container(
              height: MediaQuery.of(context).size.height / 6,
              child: Column(
                children: <Widget>[
                  FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                      getGallery();
                    },
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.image),
                        Text('From Gallery'),
                      ],
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                      getCamera();
                    },
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.camera),
                        Text('From Camera'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  Future getCamera() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected');
      }
    });
  }

  Future getGallery() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected');
      }
    });
  }

  void checkUpdate() {
    network.updateProfile(
        widget.id,
        etName.text.toString(),
        etEmail.text.toString(),
        etNohp.text.toString(),
        etAlamat.text.toString());
    sessionManager.savePreference(
        true,
        widget.id,
        etName.text.toString(),
        etEmail.text.toString(),
        "123123",
        etNohp.text.toString(),
        etAlamat.text.toString());
    print("image null");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      etName = TextEditingController(text: widget.name);
      etEmail = TextEditingController(text: widget.email);
      etNohp = TextEditingController(text: widget.nohp);
      etAlamat = TextEditingController(text: widget.alamat);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Profile'),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
//                Padding(
//                  padding: const EdgeInsets.only(left: 16, top: 16, right: 16),
//                  child: _image == null
//                      ? GestureDetector(
//                    onTap: () {
//                      myAlert();
//                    },
//                    child: Container(
//                      height: 75,
//                      width: 75,
//                      child: CircleAvatar(
//                        radius: 100,
//                      ),
//                    ),
//                  )
//                      : ClipRRect(
//                    borderRadius: BorderRadius.circular(8),
//                    child: Image.file(
//                      _image,
//                      fit: BoxFit.fill,
//                      width: MediaQuery.of(context).size.width,
//                      height: MediaQuery.of(context).size.height / 5,
//                    ),
//                  ),
//                ),

                Container(
                  height: 180,
                  width: 180,
                  child: Image.asset("images/edit.png"),
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: etName,
                  decoration: InputDecoration(
                    hintText: 'Your Full Name',
                    labelText: 'Nama',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32.0)
                    )
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: etEmail,
                  decoration: InputDecoration(
                    hintText: 'Your Email',
                    labelText: 'Email',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0)
                      )
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: etNohp,
                  decoration: InputDecoration(
                      hintText: 'Your No Hp', labelText: 'No. Telp',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0)
                      )),
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: etAlamat,
                  decoration: InputDecoration(
                      hintText: 'Your Alamat', labelText: 'Alamat',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0)
                      )),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: Material(
                        borderRadius: BorderRadius.circular(30.0),
                        shadowColor: Colors.green.shade100,
                        elevation: 5.0,
                        child: MaterialButton(
                          minWidth: 200.0,
                          height: 42.0,
                          color: Colors.green,
                          child: Text(
                            'Update Profile',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            checkUpdate();
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DashboardPage()));
                          },
                        ),
                      ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
