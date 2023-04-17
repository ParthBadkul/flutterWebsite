import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:webapp/firebase_options.dart';
// import 'package:webapp/screens/Homepage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webapp/pages/Homepage.dart';
import 'package:webapp/screens/auth_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

// Ideal time to initialize
//...
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(
            Theme.of(context).textTheme,
          ),
          brightness: Brightness.dark,
          primarySwatch: Colors.orange,
          accentColor: Colors.transparent,
        ),
        title: 'Material App',
        home: AuthPage());
  }
}
