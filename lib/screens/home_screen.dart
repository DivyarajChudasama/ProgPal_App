import 'package:flutter/material.dart';
import 'package:progpal/screens/sign-in-up/lessons_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Color color = Colors.cyan.withOpacity(0.2);
  Color color1 = Colors.blue.withOpacity(0.2);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              'ProgPal',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 183),
            Icon(Icons.search),
            SizedBox(width: 10),
            IconButton(
              onPressed: () async {
                // Navigator.of(context).pushReplacement(
                //   MaterialPageRoute(builder: (context) => SplashScreen()),
                // );
                // final SharedPreferences prefs =
                //     await SharedPreferences.getInstance();
                // await prefs.setBool('new_user', true);
              },
              icon: Icon(Icons.logout),
            )
          ],
        ),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 5,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  Color containerColor = index == 1 ? color1 : color;

                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: containerColor,
                      ),
                      height: 300,
                      width: 100,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                              width: 70,
                              child: Row(
                                children: [
                                  Icon(Icons.electric_bolt_sharp),
                                  Text(
                                    "Beginner",
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w900),
                                  ),
                                ],
                              ),
                            ),
                          ],
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
              itemCount: 4,
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
                }

                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              LessonsPage(language: language)),
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
