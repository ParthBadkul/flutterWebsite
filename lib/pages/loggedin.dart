import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class LoggedIn extends StatelessWidget {
  LoggedIn({super.key});
  void signuserOut() {
    FirebaseAuth.instance.signOut();
  }

  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text(
              'Logged in As :  ${user?.email}',
              style: TextStyle(
                fontSize: 22,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: signuserOut,
              icon: Icon(Icons.logout_outlined),
            )
          ],
        ),
      ),
    );
  }
}
