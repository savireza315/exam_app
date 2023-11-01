import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:exam_app/screen/login.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: AnimatedSplashScreen(
        splash: Image.asset('assets/images/exam.png', height: 800, width: 800,),
        nextScreen: login(),
        duration: 30,
        pageTransitionType: PageTransitionType.fade,
        backgroundColor: Colors.deepPurple,
      ),
    );
  }
}
