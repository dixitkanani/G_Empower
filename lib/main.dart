// ignore_for_file: prefer_typing_uninitialized_variables


import 'package:empower_her/screens/splash/splash_screen.dart';
import 'package:empower_her/theme.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EmpowHER',
      theme: theme(),
      home: SplashScreen(),
    );
  }
}