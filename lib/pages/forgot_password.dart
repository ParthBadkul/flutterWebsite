import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  var emailCOntroller = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailCOntroller.text);
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Link sent to Your E-mail'),
          );
        },
      );
      // Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      String p = e.code;
      wrong(p);
    }
    // Navigator.pop(context);
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
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(12),
              child: Text('Enter your email to recieve a password reset Link',
                  style: GoogleFonts.buenard(
                    color: Colors.white60,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  )),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 3,
              child: TextField(
                controller: emailCOntroller,
                style: const TextStyle(
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12), gapPadding: 12),
                  hintText: "Email",
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            TextButton(
              onPressed: passwordReset,
              child: Text('Reset Password'),
            ),
          ],
        ),
      ),
    );
  }
}
