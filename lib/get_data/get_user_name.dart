import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetuserName extends StatelessWidget {
  const GetuserName({super.key, required this.documentId});
  final String documentId;

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    //

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Text(
            'Firstname :   ${data['age']} ',
            style: TextStyle(
              color: Colors.white,
            ),
          );
        } else {
          return Text('Loading Data');
        }
      },
    );
  }
}
