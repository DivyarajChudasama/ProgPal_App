import 'package:flutter/material.dart';

class JavaFirst extends StatefulWidget {
  const JavaFirst({super.key});

  @override
  State<JavaFirst> createState() => _JavaFirstState();
}

class _JavaFirstState extends State<JavaFirst> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Java First'),
      ),
    );
  }
}
