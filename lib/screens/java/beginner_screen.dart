import 'package:flutter/material.dart';
import 'package:progpal/screens/java/java_first.dart';
import 'package:progpal/screens/java/programs/array.dart';
import 'package:progpal/screens/java/programs/basic.dart';
import 'package:progpal/screens/java/programs/collection.dart';
import 'package:progpal/screens/java/programs/file_handling.dart';

class BeginnerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Java Beginner'),
      ),
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            Container(
              constraints: BoxConstraints(maxHeight: 150.0),
              child: Material(
                color: Colors.blue,
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
                  ProgramsPage(),
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

class ProgramsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      padding: EdgeInsets.all(16.0),
      crossAxisSpacing: 16.0,
      mainAxisSpacing: 16.0,
      children: [
        Card(
          elevation: 4.0,
          child: ListTile(
            title: Text('Basic'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BasicPage()),
              );
            },
          ),
        ),
        Card(
          elevation: 4.0,
          child: ListTile(
            title: Text('Array'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ArrayPage()),
              );
            },
          ),
        ),
        Card(
          elevation: 4.0,
          child: ListTile(
            title: Text('Collection'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CollectionPage()),
              );
            },
          ),
        ),
        Card(
          elevation: 4.0,
          child: ListTile(
            title: Text('File Handling'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FileHandling()),
              );
            },
          ),
        ),
      ],
    );
  }
}
