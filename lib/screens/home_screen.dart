import 'package:flutter/material.dart';
import 'package:progpal/screens/java/java_condition_page.dart';

class HomeScreen extends StatelessWidget {
  List<String> imagePaths = [
    'assets/images/splashscreen.png',
    'assets/images/splashscreen.png',
    'assets/images/splashscreen.png',
    'assets/images/splashscreen.png',
  ];

  List<String> customTexts = [
    'Quizzes',
    'Practice',
    'Practice',
    'Practice',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.indigo,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Welcome!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Name',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: Text('Profile'),
              onTap: () {
                // Navigate to profile screen
              },
            ),
            ListTile(
              title: Text('Settings'),
              onTap: () {
                // Navigate to settings screen
              },
            ),
            ListTile(
              title: Text('Sign Out'),
              onTap: () {
                // Perform sign out action
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        title: Text('ProgPal',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.logout),
            color: Colors.white,
          )
        ],
        backgroundColor: Colors.indigo,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //           onTap: () {
            //             switch (index) {
            //               case 0:
            //                 // Redirect to screen associated with image1
            //                 break;
            //               case 1:
            //                 // Redirect to screen associated with image2
            //                 break;
            //               // Add cases for other images as needed
            //             }
            //           },
            //           child: Container(
            //             decoration: BoxDecoration(
            //               borderRadius: BorderRadius.circular(10),
            //               color: index % 2 == 0
            //                   ? Colors.indigo.withOpacity(0.9)
            //                   : Colors.indigo.withOpacity(0.9),
            //             ),
            //             height: 100,
            //             width: 100,
            //             child: Center(
            //               child: Column(
            //                 mainAxisAlignment: MainAxisAlignment.center,
            //                 children: [
            //                   Image.asset(
            //                     imagePaths[
            //                         index], // Use the image path from the list
            //                     width: 70,
            //                     height: 70,
            //                   ),
            //                   SizedBox(height: 8),
            //                   Text(
            //                     customTexts[index],
            //                     style: TextStyle(
            //                       fontSize: 14,
            //                       color: Colors.white,
            //                       fontWeight: FontWeight.bold,
            //                     ),
            //                   ),
            //                 ],
            //               ),
            //             ),
            //           ),
            //         ),
            //       );
            //     },
            //   ),
            // ),
            SizedBox(
              height: 130,
              child: PageView.builder(
                itemCount: imagePaths.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        // Handle onTap event if needed
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: index % 2 == 0
                              ? Colors.indigo.withOpacity(0.9)
                              : Colors.indigo.withOpacity(0.9),
                        ),
                        height: 200,
                        width: 100,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                imagePaths[index],
                                width: 70,
                                height: 70,
                              ),
                              SizedBox(height: 8),
                              Text(
                                customTexts[index],
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            ListView.separated(
              padding: EdgeInsets.all(30.0),
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
                    itemColor = Colors.indigo;
                    break;
                  case 1:
                    language = 'C++';
                    itemColor = Colors.indigo;
                    break;
                  case 2:
                    language = 'React';
                    itemColor = Colors.indigo;
                    break;
                  case 3:
                    language = 'GoLang';
                    itemColor = Colors.indigo;
                    break;
                  case 4:
                    language = 'Python';
                    itemColor = Colors.indigo;
                    break;
                  case 5:
                    language = 'JavaScript';
                    itemColor = Colors.indigo;
                    break;
                  case 6:
                    language = 'Node';
                    itemColor = Colors.indigo;
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
