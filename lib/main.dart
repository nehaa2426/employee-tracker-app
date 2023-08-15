import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ib_cs_hl_ia3/screens/home_screen.dart';
import 'package:ib_cs_hl_ia3/screens/login_screen.dart';
import 'package:ib_cs_hl_ia3/screens/roster.dart';
import 'package:ib_cs_hl_ia3/screens/welcome_screen.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Email and Password Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: welcomeScreen(),
    );
  }
}

