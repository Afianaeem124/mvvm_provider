import 'package:flutter/material.dart';
import 'package:mvvm_provider/utils/Routes/routes-name.dart';
import 'package:mvvm_provider/view/home_screen.dart';
import 'package:mvvm_provider/view/login.dart';
import 'package:mvvm_provider/view/sign_up.dart';
import 'package:mvvm_provider/view/splash_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.home:
        return MaterialPageRoute(builder: (context) => HomeScreen());

      case RoutesName.login:
        return MaterialPageRoute(builder: (context) => Login());

      case RoutesName.signup:
        return MaterialPageRoute(builder: (context) => SignUpScreen());

      case RoutesName.splah:
        return MaterialPageRoute(builder: (context) => SplashScreen());

      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(body: Center(child: Text('No Route Defined')));
        });
    }
  }
}
