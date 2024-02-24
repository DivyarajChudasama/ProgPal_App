import 'package:flutter/material.dart';
import 'package:progpal/screens/intro_screens.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;

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
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) {
          return IntroductionScreen(); // Navigate to IntroScreen
        }),
      );
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
