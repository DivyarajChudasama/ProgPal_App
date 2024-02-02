import 'package:flutter/material.dart';
import 'package:progpal/screens/java/beginner_screen.dart';

class JavaConditionPage extends StatefulWidget {
  @override
  _JavaConditionPageState createState() => _JavaConditionPageState();
}

class _JavaConditionPageState extends State<JavaConditionPage> {
  List<String> levels = ['Beginner', 'Have Some Knowledge', 'Expert'];
  String _selectedLevel = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Java'),
        backgroundColor: Colors.cyan,
        centerTitle: true,
      ),
      body: Container(
        color: Colors.cyan,
        child: Center(
          child: ListView.builder(
            itemCount: levels.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _selectedLevel = levels[index];
                    });
                    if (_selectedLevel == 'Beginner') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => BeginnerPage()),
                      );
                    } else {}
                  },
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            levels[index],
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          if (_selectedLevel == levels[index])
                            Icon(Icons.check_circle, color: Colors.green),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
