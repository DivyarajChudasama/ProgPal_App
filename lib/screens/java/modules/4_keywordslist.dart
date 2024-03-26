import 'package:flutter/material.dart';
import 'package:progpal/screens/java/beginner_screen.dart';

class JavaFourth extends StatefulWidget {
  const JavaFourth({Key? key}) : super(key: key);

  @override
  State<JavaFourth> createState() => _JavaFourthState();
}

class _JavaFourthState extends State<JavaFourth> {
  List<String> contents = [
    'List of Java Keywords',
    'abstract: Java abstract keyword is used to declare an abstract class. An abstract class can provide the implementation of the interface. It can have abstract and non-abstract methods.\nboolean: Java boolean keyword is used to declare a variable as a boolean type. It can hold True and False values only.',
    'break: Java break keyword is used to break the loop or switch statement. It breaks the current flow of the program at specified conditions.\nbyte: Java byte keyword is used to declare a variable that can hold 8-bit data values.\ncase: Java case keyword is used with the switch statements to mark blocks of text.',
    'catch: Java catch keyword is used to catch the exceptions generated by try statements. It must be used after the try block only.\nchar: Java char keyword is used to declare a variable that can hold unsigned 16-bit Unicode characters\nclass: Java class keyword is used to declare a class.',
    'continue: Java continue keyword is used to continue the loop. It continues the current flow of the program and skips the remaining code at the specified condition.\ndefault: Java default keyword is used to specify the default block of code in a switch statement.',
    'do: Java do keyword is used in the control statement to declare a loop. It can iterate a part of the program several times.\ndouble: Java double keyword is used to declare a variable that can hold 64-bit floating-point number. \nelse: Java else keyword is used to indicate the alternative branches in an if statement.',
    'enum: Java enum keyword is used to define a fixed set of constants. Enum constructors are always private or default.\nextends: Java extends keyword is used to indicate that a class is derived from another class or interface.',
    'final: Java final keyword is used to indicate that a variable holds a constant value. It is used with a variable. It is used to restrict the user from updating the value of the variable.\nfinally: Java finally keyword indicates a block of code in a try-catch structure. This block is always executed whether an exception is handled or not.',
    'float: Java float keyword is used to declare a variable that can hold a 32-bit floating-point number.\nfor: Java for keyword is used to start a for loop. It is used to execute a set of instructions/functions repeatedly when some condition becomes true. If the number of iteration is fixed, it is recommended to use for loop.',
    'if: Java if keyword tests the condition. It executes the if block if the condition is true.\nimplements: Java implements keyword is used to implement an interface.\nimport: Java import keyword makes classes and interfaces available and accessible to the current source code.',
    'instanceof: Java instanceof keyword is used to test whether the object is an instance of the specified class or implements an interface.\nint: Java int keyword is used to declare a variable that can hold a 32-bit signed integer.\ninterface: Java interface keyword is used to declare an interface. It can have only abstract methods.',
    'long: Java long keyword is used to declare a variable that can hold a 64-bit integer.\nnative: Java native keyword is used to specify that a method is implemented in native code using JNI (Java Native Interface).\nnew: Java new keyword is used to create new objects.',
    'null: Java null keyword is used to indicate that a reference does not refer to anything. It removes the garbage value.\npackage: Java package keyword is used to declare a Java package that includes the classes.',
    'private: Java private keyword is an access modifier. It is used to indicate that a method or variable may be accessed only in the class in which it is declared.\nprotected: Java protected keyword is an access modifier. It can be accessible within the package and outside the package but through inheritance only. It cannot be applied with the class.',
    'public: Java public keyword is an access modifier. It is used to indicate that an item is accessible anywhere. It has the widest scope among all other modifiers.\nreturn: Java return keyword is used to return from a method when its execution is complete.',
    'short: Java short keyword is used to declare a variable that can hold a 16-bit integer.\nstatic: Java static keyword is used to indicate that a variable or method is a class method. The static keyword in Java is mainly used for memory management.\nstrictfp: Java strictfp is used to restrict the floating-point calculations to ensure portability.',
    'super: Java super keyword is a reference variable that is used to refer to parent class objects. It can be used to invoke the immediate parent class method.\nswitch: The Java switch keyword contains a switch statement that executes code based on test value. The switch statement tests the equality of a variable against multiple values.',
    'synchronized: Java synchronized keyword is used to specify the critical sections or methods in multithreaded code.\nthis: Java this keyword can be used to refer the current object in a method or constructor.\nthrow: The Java throw keyword is used to explicitly throw an exception. The throw keyword is mainly used to throw custom exceptions. It is followed by an instance.',
    'throws: The Java throws keyword is used to declare an exception. Checked exceptions can be propagated with throws.\ntransient: Java transient keyword is used in serialization. If you define any data member as transient, it will not be serialized.',
    'try: Java try keyword is used to start a block of code that will be tested for exceptions. The try block must be followed by either catch or finally block.\nvoid: Java void keyword is used to specify that a method does not have a return value.\nvolatile: Java volatile keyword is used to indicate that a variable may change asynchronously.',
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
          'Java Fourth',
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
      'question': 'What is Java?',
      'options': ['A programming language', 'A fruit', 'A country'],
      'correctAnswerIndex': 0,
      'selectedAnswerIndex': -1,
    },
    {
      'question': 'What does JVM stand for?',
      'options': [
        'Java Virtual Machine',
        'Just Very Mad',
        'Jumbo Vision Module'
      ],
      'correctAnswerIndex': 0,
      'selectedAnswerIndex': -1,
    },
    {
      'question': 'Which one of these is not a data type in Java?',
      'options': ['String', 'Boolean', 'Number'],
      'correctAnswerIndex': 2,
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
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => BeginnerPage()),
          );
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
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Column(
              children: List.generate(
                  _quizData[_currentQuestionIndex]['options'].length, (index) {
                return GestureDetector(
                  onTap: () {
                    _answerQuestion(index);
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: 10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: _quizData[_currentQuestionIndex]
                                  ['selectedAnswerIndex'] ==
                              index
                          ? Colors.blue.withOpacity(0.5)
                          : Colors.transparent,
                      border: Border.all(color: Colors.blue),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      _quizData[_currentQuestionIndex]['options'][index],
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                );
              }),
            ),
            SizedBox(height: 20),
            if (_showIncorrectMessage)
              Text(
                'Incorrect answer selected!',
                style: TextStyle(color: Colors.red),
              ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _nextQuestion,
              child: Text(_currentQuestionIndex == _quizData.length - 1
                  ? 'Finish'
                  : 'Next'),
            ),
          ],
        ),
      ),
    );
  }
}