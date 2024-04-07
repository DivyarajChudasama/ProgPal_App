import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
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
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

ThemeManager _themeManager = ThemeManager();

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void dispose() {
    _themeManager.removeListener(themeListener);
    super.dispose();
  }

  @override
  void initState() {
    _themeManager.addListener(themeListener);
    super.initState();
  }

  themeListener() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'ProgPal',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: _themeManager.themeMode,
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => SplashScreen(),
        '/intro': (context) => IntroductionScreen(),
        '/login': (context) => LoginScreen(),
        '/home': (context) => HomeScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/splash') {
          if (_auth.currentUser != null) {
            return MaterialPageRoute(builder: (_) => HomeScreen());
          } else {
            return MaterialPageRoute(builder: (_) => SplashScreen());
          }
        } else {
          return MaterialPageRoute(builder: (_) => SplashScreen());
        }
      },
    );
  }
}
