import 'package:flutter/material.dart';

class JavaSecond extends StatefulWidget {
  const JavaSecond({Key? key}) : super(key: key);

  @override
  State<JavaSecond> createState() => _JavaSecondState();
}

class _JavaSecondState extends State<JavaSecond> {
  List<String> contents = [
    'Variables',
    'Data Types',
    'Arithmetic Operations',
    // Add more content items as needed
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
          'Storage and Calculation',
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
              decoration: BoxDecoration(
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
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/images/java/whatisjava.png',
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 30),
            Container(
              height: 200, // Adjust the height as needed
              width: 300,
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
              child: Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
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
            SizedBox(
              height: 10,
            ),
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
                      Icon(
                        Icons.circle,
                        size: 10,
                        color: Colors.blue, // Adjust color as needed
                      ),
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
          Navigator.pop(context);
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
