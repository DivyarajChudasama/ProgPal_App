import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class Completed extends StatelessWidget {
  final Widget nextScreen;

  Completed({required this.nextScreen});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 900, // Adjust the width as needed
              height: 500, // Adjust the height as needed
              child: Lottie.asset(
                'animations/complete.json',
                // width: 200,
                // height: 200,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to the next screen
                Get.to(nextScreen);
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.cyan[300],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'Next Topic',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
