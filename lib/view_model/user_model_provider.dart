import 'package:flutter/material.dart';
import 'package:mvvm_provider/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserModelProvider with ChangeNotifier {
  Future<bool> saveUser(UserModel user) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('token', user.token.toString());
    notifyListeners();
    return true;
  }

  Future<UserModel> getUser() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final String? token = sp.getString('token');

    notifyListeners();
    return UserModel(token: token.toString());
  }

  Future<bool> clearuser() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove('token');
    return true;
  }
}
