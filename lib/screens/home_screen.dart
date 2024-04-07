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
    'assets/images/caro1.png',
    'assets/images/caro2.png',
    'assets/images/caro3.png',
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
                          borderRadius: BorderRadius.circular(30),
                          color: index % 2 == 0
                              ? Colors.indigo.withOpacity(0.9)
                              : Colors.indigo.withOpacity(0.9),
                        ),
                        height: 200,
                        width: 300,
                        child: Center(
                          child: Image.asset(
                            imagePaths[index],
                            width: 300,
                            height:
                                200, // Adjust the height to match the container
                            fit: BoxFit.cover, // Ensure the image fits exactly
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
                  autoPlayAnimationDuration: Duration(milliseconds: 1200),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),
            SingleChildScrollView(
              physics: ScrollPhysics(),
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                padding: EdgeInsets.all(16.0),
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  buildProgramCard(
                    context,
                    'Java',
                    Colors.indigo,
                    Colors.white,
                    'assets/images/Java.png',
                    BeginnerPage(),
                  ),
                  buildProgramCard(
                    context,
                    'Flutter',
                    Colors.indigo,
                    Colors.white,
                    'assets/images/flutter.png',
                    BeginnerPage(),
                  ),
                  buildProgramCard(
                    context,
                    'C++',
                    Colors.indigo,
                    Colors.white,
                    'assets/images/cplus.png',
                    BeginnerPage(),
                  ),
                  buildProgramCard(
                    context,
                    'JavaScript',
                    Colors.indigo,
                    Colors.white,
                    'assets/images/js.png',
                    BeginnerPage(),
                  ),
                ],
              ),
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

  Widget buildProgramCard(
    BuildContext context,
    String title,
    Color textColor,
    Color backgroundColor,
    String imagePath,
    Widget page,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Card(
        color: backgroundColor,
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        margin: EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                imagePath,
                width: 90, // Adjust the width as needed
                height: 90, // Adjust the height as needed
              ),
              SizedBox(height: 12.0),
              Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: textColor, // Set text color
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
