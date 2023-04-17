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
  var emailCOntroller = TextEditingController();
  var passwordCOntroller = TextEditingController();
  var re_passController = TextEditingController();
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

  void signUp() {
    if (passwordCOntroller.text == re_passController.text) {
      try {
        FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailCOntroller.text, password: passwordCOntroller.text);
      } on FirebaseAuthException catch (e) {
        String p = e.code;
        return wrong(p);
      }
    } else {
      String p = 'Passwords Doesnt Match';
      return wrong(p);
    }
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 2,
                      height: MediaQuery.of(context).size.height,
                      color: Colors.black45,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(18),
                                child: IconButton(
                                  onPressed: widget.pa,
                                  icon: Icon(
                                    Icons.login,
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
                              'Sign Up',
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
                                )
                              ],
                            ),
                          ),
                          SizedBox(
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
                      height: MediaQuery.of(context).size.height,
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
