import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key, required this.pa});
  final Function()? pa;

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailCOntroller = TextEditingController();
  final passwordCOntroller = TextEditingController();
  final re_passController = TextEditingController();
  final _firstnameController = TextEditingController();
  final _lastnameController = TextEditingController();
  final _ageController = TextEditingController();
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

  Future signUp() async {
    if (passwordCOntroller.text == re_passController.text) {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailCOntroller.text, password: passwordCOntroller.text);

        // add user details
        addUserDetails(_firstnameController.text, _lastnameController.text,
            int.parse(_ageController.text), emailCOntroller.text);
        //
      } on FirebaseAuthException catch (e) {
        String p = e.code;
        return wrong(p);
      }
    } else {
      String p = 'Passwords Doesnt Match';
      return wrong(p);
    }
  }

  Future addUserDetails(
    String firstname,
    String lastname,
    int age,
    String email,
  ) async {
    await FirebaseFirestore.instance.collection('users').add({
      'first name': firstname,
      'last name': lastname,
      'age': age,
      'email': email,
      // 'age' : '',
    });
  }

  @override
  @override
  Widget build(BuildContext context) {
    final myWidgetKey = GlobalKey();
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Row(
                  children: [
                    Container(
                      key: myWidgetKey,
                      width: MediaQuery.of(context).size.width / 2,
                      height: MediaQuery.of(context).size.height * 1.7,
                      color: Colors.black45,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(18),
                                child: IconButton(
                                  onPressed: widget.pa,
                                  icon: const Icon(
                                    Icons.login,
                                    size: 30,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Center(
                            child: Text(
                              'Sign Up',
                              style: GoogleFonts.battambang(
                                  color: Colors.white,
                                  fontSize: 25,
                                  letterSpacing: 1.7),
                            ),
                          ),
                          const SizedBox(
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
                                const SizedBox(
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
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          gapPadding: 0),
                                      hintText: "password",
                                      contentPadding: EdgeInsets.all(12)),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  'Confirm Password',
                                  style: GoogleFonts.anekKannada(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextField(
                                  controller: re_passController,
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                  obscureText: true,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          gapPadding: 0),
                                      hintText: " re-enter password",
                                      contentPadding: EdgeInsets.all(12)),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  ' First Name',
                                  style: GoogleFonts.anekKannada(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextField(
                                  controller: _firstnameController,
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        gapPadding: 12),
                                    hintText: "First Name",
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  ' Last Name',
                                  style: GoogleFonts.anekKannada(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextField(
                                  controller: _lastnameController,
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        gapPadding: 12),
                                    hintText: "Last Name",
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  ' Age',
                                  style: GoogleFonts.anekKannada(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                                TextField(
                                  controller: _ageController,
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        gapPadding: 12),
                                    hintText: "Age",
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 38.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                  onPressed: signUp,
                                  child: Text('SIgnUp'),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 2,
                      color: Colors.white60,
                      // height: double.infinity,
                      height: MediaQuery.of(context).size.height * 1.7,
                      // RenderBox rend =  myWidgetKey.currentContext!.findRenderObject() as RenderBox ,
                      child: Center(
                        child: Text(
                          'B&W Web',
                          style: GoogleFonts.buenard(
                              fontSize: 40, letterSpacing: 1.7),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    ).animate().blurXY(begin: 100, end: 0, delay: Duration(milliseconds: 100));
  }
}
