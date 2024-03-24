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
import 'package:progpal/screens/settings/theme.dart';
import 'package:progpal/screens/settings/theme_manager.dart';
import 'package:progpal/screens/sign-in-up/login_screen.dart';
import 'package:progpal/screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

ThemeManager _themeManager = ThemeManager();

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void dispose() {
    _themeManager.removeListener(themeListner);
    super.dispose();
  }

  @override
  void initState() {
    _themeManager.addListener(themeListner);
    super.initState();
  }

  themeListner() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ProgPal',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: _themeManager.themeMode,
      home: BeginnerPage(),
    );
  }
}
