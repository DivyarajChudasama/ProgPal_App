import 'package:flutter/material.dart';
import 'package:progpal/screens/java/java_condition_page.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ProgPal', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.logout),
          )
        ],
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5, // Adjust the count as needed
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: index % 2 == 0
                            ? Colors.cyan.withOpacity(0.2)
                            : Colors.blue.withOpacity(0.2),
                      ),
                      height: 100,
                      width: 100,
                      child: Center(
                        child: Text(
                          'Category $index',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            ListView.separated(
              padding: EdgeInsets.all(20.0),
              shrinkWrap: true,
              itemCount: 7,
              separatorBuilder: (BuildContext context, int index) {
                return Divider(
                  color: Colors.grey[300],
                  thickness: 1.0,
                  height: 20.0,
                );
              },
              itemBuilder: (BuildContext context, int index) {
                String language = '';
                Color itemColor = Colors.transparent;

                switch (index) {
                  case 0:
                    language = 'Java';
                    itemColor = Colors.blue;
                    break;
                  case 1:
                    language = 'C++';
                    itemColor = Colors.green;
                    break;
                  case 2:
                    language = 'React';
                    itemColor = Colors.orange;
                    break;
                  case 3:
                    language = 'GoLang';
                    itemColor = Colors.red;
                    break;
                  case 4:
                    language = 'Python';
                    itemColor = Colors.cyan;
                    break;
                  case 5:
                    language = 'JavaScript';
                    itemColor = Colors.green;
                    break;
                  case 6:
                    language = 'Node';
                    itemColor = Colors.purple;
                    break;
                }

                return InkWell(
                  onTap: () {
                    // Navigate to JavaPage
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => JavaConditionPage()),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: itemColor,
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: ListTile(
                      title: Text(
                        language,
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      leading: Icon(
                        Icons.code,
                        color: Colors.white,
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
