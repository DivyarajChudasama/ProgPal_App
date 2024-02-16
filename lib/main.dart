import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:progpal/firebase_options.dart';
import 'package:progpal/screens/home_screen.dart';
import 'package:progpal/screens/intro_questions/intro_one.dart';
import 'package:progpal/screens/intro_screens.dart';
import 'package:progpal/screens/java/beginner_screen.dart';
import 'package:progpal/screens/java/programs/basic.dart';
import 'package:progpal/screens/otp/phoneno_screen.dart';
import 'package:progpal/screens/otp/otp_screen.dart';
import 'package:progpal/screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
      home: HomeScreen(),
    );
  }
}
