import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'ProgPal_App',
            textAlign: TextAlign.center,
          ),
        ),
        backgroundColor: Colors.purple,
      ),
      body: ListView.separated(
        padding: EdgeInsets.all(20.0),
        itemCount: 4,
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            color: Colors.grey[300],
            thickness: 1.0,
            height: 0.0,
          );
        },
        itemBuilder: (BuildContext context, int index) {
          String language = ''; // Initialize language variable outside of the switch statement
          Color itemColor = Colors.transparent; // Initial color for the list item

          switch (index) {
            case 0:
              language = 'Java';
              itemColor = Colors.blue; // Change color for each list item
              break;
            case 1:
              language = 'C++';
              itemColor = Colors.green; // Change color for each list item
              break;
            case 2:
              language = 'React';
              itemColor = Colors.orange; // Change color for each list item
              break;
            case 3:
              language = 'GoLang';
              itemColor = Colors.red; // Change color for each list item
              break;
          }

          return MouseRegion(
            onEnter: (_) {
              // When mouse enters, change the color
              itemColor = itemColor.withOpacity(0.8);
            },
            onExit: (_) {
              // When mouse exits, revert the color
              itemColor = itemColor.withOpacity(1.0);
            },
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LessonsPage(language: language)),
                );
              },
              child: Container(
                color: itemColor, // Use dynamic color for each list item
                child: ListTile(
                  title: Text(language),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class LessonsPage extends StatelessWidget {
  final String language;

  LessonsPage({required this.language});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lessons - $language'),
        backgroundColor: Colors.purple,
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
