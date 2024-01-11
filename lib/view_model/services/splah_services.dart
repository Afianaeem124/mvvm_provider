import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_provider/model/user_model.dart';
import 'package:mvvm_provider/utils/Routes/routes-name.dart';
import 'package:mvvm_provider/view_model/user_model_provider.dart';
import 'package:provider/provider.dart';

class SplashServices {
  Future<UserModel> getUserDate() => UserModelProvider().getUser();

  void checkAuthentication(BuildContext context) async {
    getUserDate().then((value) async {
      print(value.token.toString());

      if (value.token.toString() == 'null' || value.token.toString() == '') {
        await Future.delayed(Duration(seconds: 3));
        Navigator.pushNamed(context, RoutesName.login);
      } else {
        await Future.delayed(Duration(seconds: 3));
        Provider.of<UserModelProvider>(context, listen: false);

        Navigator.pushNamed(context, RoutesName.home);
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
