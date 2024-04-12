import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CppComingSoonScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'C++',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.indigo,
      ),
      body: Center(
        child: Lottie.asset('animations/comingsoon.json'),
      ),
    );
  }
}
