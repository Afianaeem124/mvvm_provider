import 'package:flutter/material.dart';
import 'package:mvvm_provider/resources/colors.dart';
import 'package:mvvm_provider/utils/Routes/routes-name.dart';
import 'package:mvvm_provider/view_model/auth_model_provider.dart';
import 'package:provider/provider.dart';
import 'package:mvvm_provider/utils/utils.dart';
import '../resources/components/roundButton.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  ValueNotifier<bool> _obscurepassword = ValueNotifier<bool>(true);
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();

  FocusNode emailfocus = FocusNode();
  FocusNode passwordfocus = FocusNode();

  void dispose() {
    super.dispose();
    _obscurepassword.dispose();
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    emailfocus.dispose();
    passwordfocus.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    final auth = Provider.of<AuthModelProvider>(context);

    return Scaffold(
      appBar: AppBar(
          title: Center(
              child:
                  Text('Sign Up ', style: TextStyle(color: AppColors.white))),
          backgroundColor: AppColors.appColor),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: _emailcontroller,
                focusNode: emailfocus,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                    hintText: 'Email',
                    labelText: 'Email',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff979797))),
                    prefixIcon: Icon(Icons.alternate_email)),
                onFieldSubmitted: (value) {
                  utils.showFocus(context, emailfocus, passwordfocus);
                },
              ),
              SizedBox(height: 20),
              ValueListenableBuilder(
                  valueListenable: _obscurepassword,
                  builder: ((context, value, child) {
                    return TextFormField(
                      controller: _passwordcontroller,
                      obscureText: _obscurepassword.value,
                      focusNode: passwordfocus,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          hintText: 'Password',
                          labelText: 'Password',
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xff979797))),
                          prefixIcon: Icon(Icons.lock_open_rounded),
                          suffix: InkWell(
                              onTap: () {
                                _obscurepassword.value =
                                    !_obscurepassword.value;
                              },
                              child: _obscurepassword.value
                                  ? Icon(Icons.visibility_off_outlined)
                                  : Icon(Icons.visibility))),
                    );
                  })),
              SizedBox(height: 25),
              RoundButton(
                title: 'Sign Up',
                loading: auth.signuploading,
                onPress: () {
                  if (_emailcontroller.text.isEmpty) {
                    utils.flushBarErrorMessage('Please enter Email', context);
                  } else if (_passwordcontroller.text.isEmpty) {
                    utils.flushBarErrorMessage(
                        'Please enter Password', context);
                  } else if (_passwordcontroller.text.length < 6) {
                    utils.flushBarErrorMessage(
                        'Password lenght is less then six', context);
                  } else {
                    Map data = {
                      'email': _emailcontroller.text,
                      'password': _passwordcontroller.text
                    };
                    auth.SignUpApi(data, context);
                    print('Api Hit');
                  }
                },
              ),
              SizedBox(height: height * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?  ",
                    textAlign: TextAlign.center,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, RoutesName.login);
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(
                          fontFamily: 'Metropolis',
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.red),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
