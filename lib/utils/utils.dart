import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mvvm_provider/resources/colors.dart';

class utils {
  static toastMessage(String message) {
    Fluttertoast.showToast(
        msg: message, backgroundColor: Colors.black, textColor: Colors.white);
  }

  static void showFocus(
      BuildContext context, FocusNode current, FocusNode nextFocus) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static void flushBarErrorMessage(String message, BuildContext context) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        forwardAnimationCurve: Curves.easeInToLinear,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: EdgeInsets.all(15),
        duration: Duration(seconds: 3),
        borderRadius: BorderRadius.circular(8),
        flushbarPosition: FlushbarPosition.TOP,
        message: message,
        backgroundColor: Colors.red,
        reverseAnimationCurve: Curves.easeInExpo,
        positionOffset: 20,
        icon: Icon(
          Icons.error,
          size: 28,
          color: Colors.white,
        ),
      )..show(context),
    );
  }

  static snackBar(String message, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: AppColors.appColor,
    ));
  }
}
