import 'package:flutter/material.dart';

class LessonsPage extends StatelessWidget {
  final String language;

  LessonsPage({required this.language});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lessons - $language'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text(
          'Lessons for $language will be displayed here',
          style: TextStyle(fontSize: 18.0),
        ),
      ),
    );
  }
}
