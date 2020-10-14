import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class RuleUtils {
  void savePreference(
      bool status,
      String idUser,
      String fullnameUser,
      String emailUser,
      String photoUser,
      String nohpUser,
      String alamatUser);
  Future getPreference();
}

class SessionManager extends RuleUtils {
  var globIduser,
      globName,
      globEmail,
      globPhoto,
      globNohp,
      globAlamat;
  var globStatus;

  @override
  Future getPreference() async{
    // TODO: implement getPreference
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    globStatus = sharedPreferences.getBool("myStatus");
    globIduser = sharedPreferences.get("myIduser");
    globName = sharedPreferences.getString("myName");
    globEmail = sharedPreferences.getString("myEmail");
//    globPhoto = sharedPreferences.getString("myPhoto");
    globNohp = sharedPreferences.getString("myTelp");
    globAlamat = sharedPreferences.getString("myAlamat");
  }

  @override
  void savePreference(bool status, String idUser, String fullnameUser,
      String emailUser,
      String photoUser,
      String nohpUser, String alamatUser)async {
    // TODO: implement savePreference
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool("myStatus", status);
    sharedPreferences.setString("myIduser", idUser);
    sharedPreferences.setString("myName", fullnameUser);
    sharedPreferences.setString("myEmail", emailUser);
    sharedPreferences.setString("myPhoto", photoUser);
    sharedPreferences.setString("myTelp", nohpUser);
    sharedPreferences.setString("myAlamat", alamatUser);
    sharedPreferences.commit();
  }


}
