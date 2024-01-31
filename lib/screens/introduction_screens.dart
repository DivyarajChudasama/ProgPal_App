import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:progpal/screens/sign-in-up/login_screen.dart';

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({Key? key}) : super(key: key);

  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

List<String> title = ['ProgPal', 'Progpal', 'ProgPal'];
List<String> desc = [
  'Thinking about how to kickstart your coding journey?',
  'Not sure which language to choose for your next project?',
  'Journey from beginner to a expert. Just a click away!'
];

class _IntroductionScreenState extends State<IntroductionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: PageView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(
                'animations/${index + 1}.json',
                height: 300,
                reverse: true,
                repeat: true,
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                title[index],
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  desc[index],
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                child: Text(
                  "Get started",
                  style: TextStyle(color: Colors.black),
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.white)),
              ),
            ],
          );
        },
      ),
    );
  }
}
