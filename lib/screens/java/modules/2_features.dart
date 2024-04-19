import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:progpal/screens/complete.dart';
import 'package:progpal/screens/java/beginner_screen.dart';
import 'package:progpal/screens/java/modules/3_comparisions.dart';

class JavaSecond extends StatefulWidget {
  const JavaSecond({Key? key}) : super(key: key);

  @override
  State<JavaSecond> createState() => _JavaSecondState();
}

class _JavaSecondState extends State<JavaSecond> {
  List<String> contents = [
    'Features of Java',
    'Simple\n\n Java is very easy to learn, and its syntax is simple, clean and easy to understand. According to Sun Microsystem,Java syntax is based on C++. Java has removed many complicated and rarely-used features, for example, explicit pointers, operator overloading, etc. There is no need to remove unreferenced objects because there is an Automatic Garbage Collection in Java. \n\nObject-oriented\n\n Java is an object-oriented programming language. Everything in Java is an object. Object-oriented means we organize our software as a combination of different types of objects that incorporate both data and behavior.Object-oriented programming is a methodology that simplifies software development and maintenance by providing some rules.',
    'Basic concepts of OOPs are:\n\n Object\n Class\n Inheritance\n Polymorphism\n Abstraction\n Encapsulation \n\nPlatform Independent\n\n Java is platform independent Java is platform independent because it is different from other languages like C, C++, etc. which are compiled into platform specific machines while Java is a write once, run anywhere language. A platform is the hardware or software environment in which a program runs. Java provides a software-based platform.',
    'Secured\n\n Java is best known for its security. With Java, we can develop virus-free systems. Java is secured because: \nNo explicit pointer \nJava Programs run inside a virtual machine sandboxhow Java is secured. \nClassloader: Classloader in Java is a part of the Java Runtime Environment (JRE) which is used to load Java classes into the Java Virtual Machine dynamically. It adds security by separating the package for the classes of the local file system from those that are imported from network sources. \nSecurity Manager: It determines what resources a class can access such as reading and writing to the local disk.',
    'Robust \n\n Java is robust because: \n It uses strong memory management. \n There is a lack of pointers that avoids security problems.\nJava provides automatic garbage collection which runs on the Java Virtual Machine to get rid of objects which are not being used by a Java application anymore.\nThere are exception handling and the type checking mechanism in Java. \n\nArchitecture-neutral\n\nJava is architecture neutral because there are no implementation dependent features, for example, the size of primitive types is fixed.\n\nPortable\nJava is portable because it facilitates you to carry the Java bytecode to any platform. It does not require any implementation.',
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
          'Java Second',
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
      'question':
          'What is one of the main features of Java that makes it easy to learn?',
      'options': ['Simple syntax', 'Complex syntax', 'Dynamic typing'],
      'correctAnswerIndex': 0,
      'selectedAnswerIndex': -1,
    },
    {
      'question':
          'What does it mean when we say Java is an object-oriented programming language?',
      'options': [
        'Everything in Java is an object',
        'Java has no classes',
        'Java does not support inheritance'
      ],
      'correctAnswerIndex': 0,
      'selectedAnswerIndex': -1,
    },
    {
      'question':
          'Which of the following is NOT a basic concept of Object-Oriented Programming (OOPs) in Java?',
      'options': ['Object', 'Class', 'Sequence'],
      'correctAnswerIndex': 2,
      'selectedAnswerIndex': -1,
    },
    {
      'question': 'What makes Java platform independent?',
      'options': [
        'Write once, run anywhere',
        'Dependent on specific hardware',
        'Limited to certain operating systems'
      ],
      'correctAnswerIndex': 0,
      'selectedAnswerIndex': -1,
    },
    {
      'question':
          'What contributes to Java being considered a secured language?',
      'options': [
        'No explicit pointers',
        'Automatic garbage collection',
        'Classloader'
      ],
      'correctAnswerIndex': 2,
      'selectedAnswerIndex': -1,
    },
    {
      'question': 'Which feature of Java contributes to its robustness?',
      'options': [
        'Strong memory management',
        'Dynamic typing',
        'Lack of exception handling'
      ],
      'correctAnswerIndex': 0,
      'selectedAnswerIndex': -1,
    },
    {
      'question': 'What does it mean when we say Java is architecture-neutral?',
      'options': [
        'No implementation-dependent features',
        'Dependent on specific hardware architecture',
        'Limited to certain operating systems'
      ],
      'correctAnswerIndex': 0,
      'selectedAnswerIndex': -1,
    },
    {
      'question': 'How does Java achieve portability?',
      'options': [
        'By carrying Java bytecode to any platform',
        'By compiling directly to machine code',
        'By requiring specific platform adaptations'
      ],
      'correctAnswerIndex': 0,
      'selectedAnswerIndex': -1,
    },
    {
      'question': 'What is the primary role of a Classloader in Java?',
      'options': [
        'To load Java classes into the Java Virtual Machine dynamically',
        'To manage garbage collection',
        'To handle runtime exceptions'
      ],
      'correctAnswerIndex': 0,
      'selectedAnswerIndex': -1,
    },
    {
      'question':
          'What is the significance of the Java Virtual Machine (JVM) in ensuring platform independence?',
      'options': [
        'It abstracts hardware differences',
        'It enforces strict typing rules',
        'It limits the use of external libraries'
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
          Get.to(Completed(nextScreen: JavaThird()));
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
