import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:progpal/screens/intro_screens.dart';
import 'package:progpal/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();

    _fadeController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );

    _fadeAnimation = Tween<double>(
      begin: 1.0,
      end: 0.0,
    ).animate(_fadeController);

    // Start the fade-in animation
    _fadeController.forward();

    Future.delayed(Duration(seconds: 3), () {
      if (_auth.currentUser != null) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      } else {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => IntroductionScreen()),
        );
      }
    });
  }

  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: Center(
        child: AnimatedOpacity(
          opacity: _fadeAnimation.value,
          duration: Duration(seconds: 6),
          child: Image.asset(
            'assets/images/splashscreen.png',
            height: 200,
            width: 200,
          ),
        ),
      ),
    );
  }
}
