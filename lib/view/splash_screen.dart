import 'package:flutter/material.dart';
import 'package:mvvm_provider/view_model/services/splah_services.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices splashservice = SplashServices();
  var colorizeColors = [
    Color.fromARGB(255, 218, 65, 9),
    Colors.brown,
    Color.fromARGB(255, 82, 47, 35),
    Color.fromARGB(255, 224, 139, 108),
  ];
  var colorizeTextStyle = TextStyle(
    fontSize: 50.0,
    fontFamily: 'Horizon',
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashservice.checkAuthentication(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Center(
        child: AnimatedTextKit(animatedTexts: [
          ColorizeAnimatedText('Splah Screen',
              colors: colorizeColors, textStyle: colorizeTextStyle)
        ]),
      ),
    ]));
  }
}
