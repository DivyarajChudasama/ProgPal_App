import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:progpal/screens/settings/premium.dart';

class PremiumFeaturesScreen extends StatefulWidget {
  @override
  _PremiumFeaturesScreenState createState() => _PremiumFeaturesScreenState();
}

class _PremiumFeaturesScreenState extends State<PremiumFeaturesScreen> {
  double _containerWidth = 0.0;
  double _containerHeight = 0.0;
  Color _containerColor = Colors.indigo;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startAnimation();
  }

  void _startAnimation() {
    _timer = Timer.periodic(Duration(seconds: 2), (timer) {
      setState(() {
        _containerHeight = _containerHeight == _containerWidth * 0.5
            ? _containerWidth * 0.6
            : _containerWidth * 0.5;
        _containerColor = _containerColor == Colors.purpleAccent
            ? Colors.purple
            : Colors.pinkAccent;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _containerWidth =
        MediaQuery.of(context).size.width * 0.8; // 80% of screen width
    _containerHeight = _containerWidth * 0.5; // maintaining 2:1 aspect ratio

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'Premium',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.indigo,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            // Animated container for premium features
            AnimatedContainer(
              duration: Duration(seconds: 1),
              curve: Curves.easeInOut,
              height: _containerHeight,
              width: _containerWidth,
              decoration: BoxDecoration(
                color: _containerColor,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Center(
                child: Text(
                  'Premium Features',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Exclusive Premium Features:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
              ),
            ),
            SizedBox(height: 10),
            FeatureItem(
              title:
                  'Shortlisted interview questions from Google, Amazon, etc.',
              icon: Icons.question_answer,
            ),
            FeatureItem(
              title: 'Private video playlist to learn topics thoroughly.',
              icon: Icons.video_library,
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                Get.to(UPI());
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                  side: BorderSide(color: Colors.indigo, width: 2),
                ),
              ),
              child: Text(
                'Get Premium',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FeatureItem extends StatelessWidget {
  final String title;
  final IconData icon;

  const FeatureItem({
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          Icon(icon,
              color: Colors.indigo,
              size: 24), // Adjust the size of the icon if needed
          SizedBox(width: 10),
          Flexible(
            child: Text(
              title,
              style: TextStyle(fontSize: 16),
              overflow: TextOverflow.fade, // Fade overflowed text
              maxLines: 2, // Maximum of 2 lines
            ),
          ),
        ],
      ),
    );
  }
}
