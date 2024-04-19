import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:progpal/screens/complete.dart';
import 'package:progpal/screens/java/beginner_screen.dart';
import 'package:progpal/screens/java/modules/2_features.dart';
import 'package:progpal/screens/java/modules/5_oops.dart';

class JavaFirst extends StatefulWidget {
  const JavaFirst({Key? key}) : super(key: key);

  @override
  State<JavaFirst> createState() => _JavaFirstState();
}

class _JavaFirstState extends State<JavaFirst> {
  List<String> contents = [
    'What is Java?',
    'Java is a programming language and a platform. Java is a high level, robust, object-oriented and secure programming language.\n Java was developed by Sun Microsystems (which is now the subsidiary of Oracle) in the year 1995. James Gosling is known as the father of Java. Before Java, its name was Oak. Since Oak was already a registered company, so James Gosling and his team changed the name from Oak to Java. \n\nTypes of Applications \n\n 1) Standalone Application\n Standalone applications are also known as desktop applications or window-based applications. These are traditional software that we need to install on every machine. Examples of standalone application are Media player, antivirus, etc. AWT and Swing are used in Java for creating standalone applications.',
    '2) Web Application \n\n An application that runs on the server side and creates a dynamic page is called a web application. Currently, Servlet, JSP, Struts, Spring, Hibernate, JSF, etc. technologies are used for creating web applications in Java. \n\n3) Enterprise Application \n\n An application that is distributed in nature, such as banking applications, etc. is called an enterprise application. It has advantages like high-level security, load balancing, and clustering. In Java, EJB is used for creating enterprise applications.',
    '4) Mobile Application \n\n An application which is created for mobile devices is called a mobile application. Currently, Android and Java ME are used for creating mobile applications. \n\nJava Platforms / Editions \n 1) Java SE (Java Standard Edition) \n It is a Java programming platform. It includes Java programming APIs such as java.lang, java.io, java.net, java.util, java.sql, java.math etc. It includes core topics like OOPs, String, Regex, Exception, Inner classes, Multithreading, I/O Stream, Networking, AWT, Swing, Reflection, Collection, etc.',
    '2) Java EE (Java Enterprise Edition)\n It is an enterprise platform that is mainly used to develop web and enterprise applications. It is built on top of the Java SE platform. It includes topics like Servlet, JSP, Web Services, EJB, JPA, etc. \n\n3) Java ME (Java Micro Edition)\n It is a micro platform that is dedicated to mobile applications. \n\n4) JavaFX\n It is used to develop rich internet applications. It uses a lightweight user interface API.',
  ];
  int currentIndex = 0;
  bool showSummary = false;

  void changeContent() {
    setState(() {
      if (currentIndex < contents.length - 1) {
        currentIndex++;
      } else {
        showSummary = true;
      }
    });
  }

  void reset() {
    setState(() {
      currentIndex = 0;
      showSummary = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'Introduction',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.indigo,
      ),
      body: showSummary ? _buildSummary() : _buildContent(),
    );
  }

  Widget _buildContent() {
    return GestureDetector(
      onTap: () {
        changeContent();
      },
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 20),
              height: 250, // Smaller robot
              child: Image.asset(
                'assets/images/java/whatisjava.png',
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 30),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  width: 500,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          contents[currentIndex],
                          style: TextStyle(fontSize: 18),
                          textAlign: TextAlign.center,
                        ),
                        if (currentIndex == 0)
                          Text(
                            'Tap the screen to continue',
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            if (currentIndex == contents.length - 1)
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    showSummary = true;
                  });
                },
                child: Text('Finish'),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummary() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Summary',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: contents.map((content) {
                  return Container(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        // Icon(
                        //   Icons.circle,
                        //   size: 10,
                        //   color: Colors.blue, // Adjust color as needed
                        // ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            content,
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  reset();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => QuizScreen()),
                  );
                },
                child: Text('Test Your Knowledge'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentQuestionIndex = 0;
  List<Map<String, dynamic>> _quizData = [
    {
      'question': 'What is a Java package?',
      'options': [
        'A collection of classes and interfaces',
        'A single class or interface',
        'A data type in Java'
      ],
      'correctAnswerIndex': 0,
      'selectedAnswerIndex': -1,
    },
    {
      'question': 'What is the difference between JDK and JRE?',
      'options': [
        'JDK includes JRE along with development tools',
        'JRE includes JDK along with runtime environment',
        'There is no difference between JDK and JRE'
      ],
      'correctAnswerIndex': 0,
      'selectedAnswerIndex': -1,
    },
    {
      'question': 'What is a Java Virtual Machine (JVM)?',
      'options': [
        'An abstract computing machine that enables a computer to run a Java program',
        'A physical machine used for Java programming',
        'A tool used to compile Java code'
      ],
      'correctAnswerIndex': 0,
      'selectedAnswerIndex': -1,
    },
    {
      'question': 'What is the purpose of the keyword "final" in Java?',
      'options': [
        'To declare constants, make variables unmodifiable, and prevent inheritance',
        'To indicate the end of a method or class',
        'To initialize a variable'
      ],
      'correctAnswerIndex': 0,
      'selectedAnswerIndex': -1,
    },
    {
      'question': 'What is the concept of "polymorphism" in Java?',
      'options': [
        'The ability of an object to take on many forms',
        'The ability to create multiple objects of the same class',
        'The ability to call methods of the superclass'
      ],
      'correctAnswerIndex': 0,
      'selectedAnswerIndex': -1,
    },
    {
      'question': 'What is an abstract class in Java?',
      'options': [
        'A class that cannot be instantiated and may contain abstract methods',
        'A class that can be instantiated but cannot contain abstract methods',
        'A class with no constructors'
      ],
      'correctAnswerIndex': 0,
      'selectedAnswerIndex': -1,
    },
    {
      'question': 'What is the purpose of the "super" keyword in Java?',
      'options': [
        'To call methods of the superclass',
        'To initialize an object of the superclass',
        'To access static variables of the superclass'
      ],
      'correctAnswerIndex': 0,
      'selectedAnswerIndex': -1,
    },
    {
      'question':
          'What is the difference between "==" and ".equals()" in Java?',
      'options': [
        '"==" compares object references, while ".equals()" compares object values',
        '"==" compares object values, while ".equals()" compares object references',
        'There is no difference between "==" and ".equals()"'
      ],
      'correctAnswerIndex': 0,
      'selectedAnswerIndex': -1,
    },
    {
      'question': 'What is the purpose of the "this" keyword in Java?',
      'options': [
        'To refer to the current object instance',
        'To refer to the superclass object',
        'To initialize static variables'
      ],
      'correctAnswerIndex': 0,
      'selectedAnswerIndex': -1,
    },
    {
      'question':
          'What is the purpose of the "try", "catch", and "finally" blocks in Java?',
      'options': [
        'To handle exceptions in code and ensure cleanup operations',
        'To define variable scopes',
        'To control the flow of execution'
      ],
      'correctAnswerIndex': 0,
      'selectedAnswerIndex': -1,
    },
  ];

  bool _showIncorrectMessage = false;

  void _answerQuestion(int selectedIndex) {
    setState(() {
      _quizData[_currentQuestionIndex]['selectedAnswerIndex'] = selectedIndex;
      _showIncorrectMessage = false;
    });
  }

  void _nextQuestion() {
    setState(() {
      if (_quizData[_currentQuestionIndex]['selectedAnswerIndex'] == -1 ||
          _quizData[_currentQuestionIndex]['selectedAnswerIndex'] !=
              _quizData[_currentQuestionIndex]['correctAnswerIndex']) {
        _showIncorrectMessage = true;
      } else {
        if (_currentQuestionIndex < _quizData.length - 1) {
          _currentQuestionIndex++;
        } else {
          Get.to(Completed(nextScreen: JavaSecond()));
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              _quizData[_currentQuestionIndex]['question'],
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _quizData[_currentQuestionIndex]['options'].length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      _answerQuestion(index);
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 10),
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: _quizData[_currentQuestionIndex]
                                    ['selectedAnswerIndex'] ==
                                index
                            ? Colors.blue.withOpacity(0.8)
                            : Colors.transparent,
                        border: Border.all(color: Colors.blue, width: 2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          _quizData[_currentQuestionIndex]['options'][index],
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            if (_showIncorrectMessage)
              Text(
                'Incorrect answer selected!',
                style: TextStyle(color: Colors.red, fontSize: 16),
              ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _nextQuestion,
              style: ElevatedButton.styleFrom(
                // primary: Colors.blue,
                backgroundColor: Colors.blue.shade100,
                padding: EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                _currentQuestionIndex == _quizData.length - 1
                    ? 'Finish'
                    : 'Next',
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
