import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_provider/model/user_model.dart';
import 'package:mvvm_provider/repository/auth_repository.dart';
import 'package:mvvm_provider/utils/Routes/routes-name.dart';
import 'package:mvvm_provider/utils/utils.dart';
import 'package:mvvm_provider/view_model/user_model_provider.dart';
import 'package:provider/provider.dart';

class AuthModelProvider with ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;

  bool _signuploading = false;
  bool get signuploading => _signuploading;

  final _Repo = AuthRepository();

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  setSignUpLoading(bool value) {
    _signuploading = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoading(true);

    _Repo.loginApi(data).then((value) {
      //utils.flushBarErrorMessage('Login Successfully', context);
      utils.snackBar('Login Successfully', context);
      setLoading(false);
      final sp = Provider.of<UserModelProvider>(context, listen: false);
      sp.saveUser(UserModel(token: value['token'].toString()));

      Navigator.pushNamed(context, RoutesName.home);
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        utils.flushBarErrorMessage(error.toString(), context);
        print(error.toString());
        setLoading(false);
      }
    });
  }

  Future<void> SignUpApi(dynamic data, BuildContext context) async {
    setSignUpLoading(true);

    _Repo.signUpApi(data).then((value) {
      //utils.flushBarErrorMessage('Login Successfully', context);
      utils.snackBar('SignUp Successfully', context);

      setSignUpLoading(false);
      Navigator.pushNamed(context, RoutesName.home);
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        utils.flushBarErrorMessage(error.toString(), context);
        print(error.toString());
        setSignUpLoading(false);
      }
    });
  }
}
