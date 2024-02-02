import 'package:flutter/material.dart';
import 'package:progpal/screens/home_screen.dart';

class IntroOne extends StatefulWidget {
  @override
  _IntroOneState createState() => _IntroOneState();
}

class _IntroOneState extends State<IntroOne> {
  String selectedOption = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tell us about yourself"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "What are you currently doing?",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0),
            Expanded(
              child: ListView(
                children: [
                  buildOption("Undergraduate", context),
                  buildOption("Graduate", context),
                  buildOption("Working", context),
                  buildOption("Other", context),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              },
              child: Text(
                "Home",
                style: TextStyle(color: Colors.black),
              ),
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.white)),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildOption(String option, BuildContext context) {
    bool isSelected = selectedOption == option;

    return GestureDetector(
      onTap: () {
        setState(() {
          // Update the selected option
          selectedOption = option;
        });
      },
      child: Container(
        padding: EdgeInsets.all(12.0),
        margin: EdgeInsets.symmetric(vertical: 8.0),
        decoration: BoxDecoration(
          color: isSelected ? Colors.green : Colors.blue.withOpacity(0.2),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Text(
          option,
          style: TextStyle(
            fontSize: 16.0,
            color: isSelected ? Colors.white : null,
          ),
        ),
      ),
    );
  }
}
