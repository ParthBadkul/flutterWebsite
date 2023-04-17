import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:webapp/pages/Homepage.dart';
import 'package:webapp/pages/loggedin.dart';
import 'package:webapp/screens/register_and_login.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          //user logged in
          if (snapshot.hasData) {
            return LoggedIn();
          } else {
            return Login_Register();
          }

          // user not logged in
        },
      ),
    );
  }
}
