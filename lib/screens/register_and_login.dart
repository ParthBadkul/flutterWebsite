import 'package:flutter/material.dart';
import 'package:webapp/pages/Homepage.dart';
import 'package:webapp/pages/register_page.dart';

class Login_Register extends StatefulWidget {
  Login_Register({super.key});

  @override
  State<Login_Register> createState() => _Login_RegisterState();
}

class _Login_RegisterState extends State<Login_Register> {
  bool showLogin = true;
  void toggleScreen() {
    setState(() {
      showLogin = !showLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLogin == true) {
      return HomePage(
        pa: toggleScreen,
      );
    } else {
      return RegisterPage(pa: toggleScreen);
    }
  }
}
