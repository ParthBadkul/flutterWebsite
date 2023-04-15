import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var numberCOntroller = TextEditingController();

  var emailCOntroller = TextEditingController();

  var passwordCOntroller = TextEditingController();

  void signUserIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailCOntroller.text, password: passwordCOntroller.text);
    } on FirebaseAuthException catch (e) {
      String p = e.code;

      return wrong(p);
    }
  }

  void wrong(String p) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(p),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverList(
              delegate: SliverChildListDelegate([
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 2,
                  color: Colors.white60,
                  height: MediaQuery.of(context).size.height,
                  child: Center(
                    child: Text(
                      'B&W Web',
                      style:
                          GoogleFonts.buenard(fontSize: 40, letterSpacing: 1.7),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 2,
                  height: MediaQuery.of(context).size.height,
                  color: Colors.black45,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(18),
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.person_add_alt_1,
                                size: 30,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Center(
                        child: Text(
                          'UNITY',
                          style: GoogleFonts.battambang(
                              color: Colors.white,
                              fontSize: 25,
                              letterSpacing: 1.7),
                        ),
                      ),
                      SizedBox(
                        height: 90,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              ' Username',
                              style: GoogleFonts.anekKannada(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextField(
                              controller: emailCOntroller,
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    gapPadding: 12),
                                hintText: "Email",
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              ' Password',
                              style: GoogleFonts.anekKannada(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextField(
                              controller: passwordCOntroller,
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                              obscureText: true,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      gapPadding: 0),
                                  hintText: "password",
                                  contentPadding: EdgeInsets.all(12)),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 38.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: signUserIn,
                              child: Text('SIgnIn'),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )
          ]))
        ],
      ),
    );
  }
}
