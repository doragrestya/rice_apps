import 'package:shared_preferences/shared_preferences.dart';

abstract class RuleUtils{
  void saveData(String tempCode);
  Future getCode();
}

class GenerateCode extends RuleUtils{
  String globalCode;

  @override
  Future getCode() async{
    // TODO: implement getCode
    SharedPreferences pref = await SharedPreferences.getInstance();
    globalCode = pref.getString("code");
  }

  @override
  void saveData(String tempCode) async{
    // TODO: implement saveData
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("code", tempCode);

    sharedPreferences.commit();
  }

}