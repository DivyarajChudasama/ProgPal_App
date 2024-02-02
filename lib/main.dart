import 'package:flutter/material.dart';
import 'package:progpal/screens/home_screen.dart';
import 'package:progpal/screens/intro_questions/intro_one.dart';
import 'package:progpal/screens/intro_screens.dart';
import 'package:progpal/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ProgPal',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}
