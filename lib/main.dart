import 'package:flutter/material.dart';
import 'package:mvvm_provider/data/response/app_exceptions.dart';
import 'package:mvvm_provider/resources/colors.dart';
import 'package:mvvm_provider/utils/Routes/routes-name.dart';
import 'package:mvvm_provider/utils/Routes/routes.dart';
import 'package:mvvm_provider/view_model/auth_model_provider.dart';
import 'package:mvvm_provider/view_model/user_model_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => AuthModelProvider()),
          ChangeNotifierProvider(create: (_) => UserModelProvider()),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: AppColors.appColor),
            useMaterial3: true,
          ),
          initialRoute: RoutesName.splah,
          onGenerateRoute: Routes.generateRoute,
        ));
  }
}
