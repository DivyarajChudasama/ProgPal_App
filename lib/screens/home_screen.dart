import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart'; // Import Get package
import 'package:progpal/screens/java/beginner_screen.dart';
import 'package:progpal/screens/settings/notifi_config.dart';
import 'package:progpal/screens/settings/settings_screen.dart';
import 'package:progpal/screens/sign-in-up/login_screen.dart'; // Import LoginScreen

final FirebaseAuth _auth = FirebaseAuth.instance;

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
                  FutureBuilder<User?>(
                    future: _getCurrentUser(),
                    builder:
                        (BuildContext context, AsyncSnapshot<User?> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      }
                      if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      }
                      final user = snapshot.data;
                      return Text(
                        user?.email ?? 'Unknown',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      );
                    },
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
              title: Text('Notifications'),
              onTap: () {
                Get.to(NotificationConfigScreen()); // Use Get.to for navigation
              },
            ),
            ListTile(
              title: Text('Settings'),
              onTap: () {
                Get.to(SettingsScreen()); // Use Get.to for navigation
              },
            ),
            ListTile(
              title: Text('Sign Out'),
              onTap: () {
                Get.defaultDialog(
                  title: "Sign Out",
                  middleText: "Are you sure you want to sign out?",
                  actions: [
                    TextButton(
                      onPressed: () {
                        Get.back(); // Close the dialog
                      },
                      child: Text("No"),
                    ),
                    TextButton(
                      onPressed: () {
                        // Perform sign out action
                        _signOut();
                      },
                      child: Text("Yes"),
                    ),
                  ],
                );
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
            onPressed: () {
              Get.defaultDialog(
                title: "Sign Out",
                middleText: "Are you sure you want to sign out?",
                actions: [
                  TextButton(
                    onPressed: () {
                      Get.back(); // Close the dialog
                    },
                    child: Text("No"),
                  ),
                  TextButton(
                    onPressed: () {
                      // Perform sign out action
                      _signOut();
                    },
                    child: Text("Yes"),
                  ),
                ],
              );
            },
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
            SizedBox(
              height: 200,
              child: CarouselSlider.builder(
                itemCount: imagePaths.length,
                itemBuilder: (context, index, realIndex) {
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
                        width: 300,
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
                options: CarouselOptions(
                  height: 200,
                  enableInfiniteScroll: true,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal,
                ),
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
                    Get.to(BeginnerPage()); // Use Get.to for navigation
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

  Future<User?> _getCurrentUser() async {
    return _auth.currentUser;
  }

  void _signOut() async {
    await FirebaseAuth.instance.signOut();
    Get.offAll(() => LoginScreen());
  }
}
