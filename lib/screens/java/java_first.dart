import 'package:flutter/material.dart';

class JavaFirst extends StatefulWidget {
  const JavaFirst({Key? key}) : super(key: key);

  @override
  State<JavaFirst> createState() => _JavaFirstState();
}

class _JavaFirstState extends State<JavaFirst> {
  List<String> contents = [
    'What is Java?',
    'Java is a programming language...',
    'Java basics include variables, data types...',
    'Java is an object-oriented programming language...',
  ];
  int currentIndex = 0;

  void changeContent() {
    setState(() {
      currentIndex = (currentIndex + 1) % contents.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        changeContent();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Java First'),
        ),
        body: Center(
          child: Column(
            children: [
              Image.asset(
                'assets/images/java/whatisjava.png',
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 20),
              Text(
                contents[currentIndex],
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
