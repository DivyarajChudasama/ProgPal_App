import 'package:flutter/material.dart';
import 'package:progpal/screens/java/java_first.dart';

class BeginnerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Java Beginner'),
      ),
      body: DefaultTabController(
        length: 3, // Number of tabs
        child: Column(
          children: [
            Container(
              constraints: BoxConstraints(maxHeight: 150.0),
              child: Material(
                color: Colors.blue, // TabBar color
                child: TabBar(
                  tabs: [
                    Tab(text: 'Index'),
                    Tab(text: 'Programs'),
                    Tab(text: 'Description'),
                  ],
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  IndexPage(),
                  Center(
                    child: Text(
                      'Programs Content',
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                  Center(
                    child: Text(
                      'Description Content',
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class IndexPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ExpansionTile(
          title: Text('Introduction to Java'),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => JavaFirst()),
                    );
                  },
                  child: Text('Start'),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.cyan),
                  ),
                ),
              ],
            ),
            DropdownMenuItem(child: Text('What is Java?')),
            DropdownMenuItem(child: Text('Where is Java used?')),
            DropdownMenuItem(child: Text('How does Java work?')),
          ],
        ),
        ExpansionTile(
          title: Text('Storage and Calculation'),
          children: [
            // Add dropdown items for storage and calculation
          ],
        ),
        ExpansionTile(
          title: Text('Decision Making in Java'),
          children: [
            // Add dropdown items for decision making in Java
          ],
        ),
      ],
    );
  }
}
