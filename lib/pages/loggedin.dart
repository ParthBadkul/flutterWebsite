import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:webapp/get_data/get_user_name.dart';

class LoggedIn extends StatefulWidget {
  LoggedIn({super.key});

  @override
  State<LoggedIn> createState() => _LoggedInState();
}

class _LoggedInState extends State<LoggedIn> {
  void signuserOut() {
    FirebaseAuth.instance.signOut();
  }

  final user = FirebaseAuth.instance.currentUser;

  // docuent IDs
  List<String> docIDs = [];

  Future getDocID() async {
    await FirebaseFirestore.instance.collection('users').get().then(
          (snapshot) => snapshot.docs.forEach((document) {
            print(document.reference);
            docIDs.add(document.reference.id);
          }),
        );
  }

  @override
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
            ),
            Expanded(
                child: FutureBuilder(
              future: getDocID(),
              builder: (context, snapshot) {
                return ListView.builder(
                  itemCount: docIDs.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                        title: GetuserName(documentId: docIDs[index]));
                  },
                );
              },
            ))
          ],
        ),
      ),
    );
  }
}
