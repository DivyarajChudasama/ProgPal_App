import 'package:flutter/material.dart';
import 'package:progpal/screens/java/beginner_screen.dart';

class JavaFifth extends StatefulWidget {
  const JavaFifth({Key? key}) : super(key: key);

  @override
  State<JavaFifth> createState() => _JavaFifthState();
}

class _JavaFifthState extends State<JavaFifth> {
  List<String> contents = [
    'Java OOPs Concepts',
    'Object means a real-world entity such as a pen, chair, table, computer, watch, etc. Object-Oriented Programming is a methodology or paradigm to design a program using classes and objects. It simplifies software development and maintenance by providing some concepts:',
    'Object\nClass\nInheritance\nPolymorphism\nAbstraction\nEncapsulation',
    'Object\nAny entity that has state and behavior is known as an object. For example, a chair, pen, table, keyboard, bike, etc. It can be physical or logical. ',
    'An Object can be defined as an instance of a class. An object contains an address and takes up some space in memory. Objects can communicate without knowing the details of each others data or code. The only necessary thing is the type of message accepted and the type of response returned by the objects.',
    'Example: A dog is an object because it has states like color, name, breed, etc. as well as behaviors like wagging the tail, barking, eating, etc',
    'Class\n\nCollection of objects is called class. It is a logical entity.\n\nA class can also be defined as a blueprint from which you can create an individual object. Class does not consume any space.',
    'Inheritance\n\nWhen one object acquires all the properties and behaviors of a parent object, it is known as inheritance. It provides code reusability. It is used to achieve runtime polymorphism.',
    'Polymorphism\nIf one task is performed in different ways, it is known as polymorphism. For example: to convince the customer differently, to draw something, for example, shape, triangle, rectangle, etc.',
    'In Java, we use method overloading and method overriding to achieve polymorphism.\nAnother example can be to speak something; for example, a cat speaks meow, dog barks woof, etc.',
    'Abstraction\n\nHiding internal details and showing functionality is known as abstraction. For example phone call, we do not know the internal processing.\n\nIn Java, we use abstract class and interface to achieve abstraction.',
    'Encapsulation\n\nBinding (or wrapping) code and data together into a single unit are known as encapsulation. For example, a capsule, it is wrapped with different medicines.\nA java class is the example of encapsulation. Java bean is the fully encapsulated class because all the data members are private here.',
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
          'Java Fifth',
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
