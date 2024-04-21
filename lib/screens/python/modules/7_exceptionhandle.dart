import 'package:flutter/material.dart';
import 'package:progpal/screens/java/beginner_screen.dart';

class PythonSeventh extends StatefulWidget {
  const PythonSeventh({Key? key}) : super(key: key);

  @override
  State<PythonSeventh> createState() => _PythonSeventhState();
}

class _PythonSeventhState extends State<PythonSeventh> {
  List<String> contents = [
    'Java Exception Handling',
    'The Exception Handling in Java is one of the powerful mechanism to handle the runtime errors so that the normal flow of the application can be maintained. \n\n In Java, an exception is an event that disrupts the normal flow of the program. It is an object which is thrown at runtime.\n\nException Handling is a mechanism to handle runtime errors such as ClassNotFoundException, IOException, SQLException, RemoteException, etc.'
        'Advantage of Exception Handling\n\nThe core advantage of exception handling is to maintain the normal flow of the application. An exception normally disrupts the normal flow of the application; that is why we need to handle exceptions. Let us consider a scenario: \nSuppose there are 10 statements in a Java program and an exception occurs at statement 5; the rest of the code will not be executed, i.e., statements 6 to 10 will not be executed. However, when we perform exception handling, the rest of the statements will be executed. That is why we use exception handling in Java.'
        'Types of Java Exceptions\n\nThere are mainly two types of exceptions: checked and unchecked. An error is considered as the unchecked exception. However, according to Oracle, there are three types of exceptions namely:\n\n1.Checked Exception\n2. Unchecked Exception \n3. Error'
        'Difference between Checked and Unchecked Exceptions\n\n1) Checked Exception\nThe classes that directly inherit the Throwable class except RuntimeException and Error are known as checked exceptions. For example, IOException, SQLException, etc. Checked exceptions are checked at compile-time. \n\n2) Unchecked Exception\nThe classes that inherit the RuntimeException are known as unchecked exceptions. For example, ArithmeticException, NullPointerException, ArrayIndexOutOfBoundsException, etc. Unchecked exceptions are not checked at compile-time, but they are checked at runtime. \n\n3) Error\nError is irrecoverable. Some example of errors are OutOfMemoryError, VirtualMachineError, AssertionError etc.'
        'Java Exception Keywords\n\ntry - The "try" keyword is used to specify a block where we should place an exception code. It means we cannot use try block alone. The try block must be followed by either catch or finally. \n\n catch - The "catch" block is used to handle the exception. It must be preceded by try block which means we cannot use catch block alone. It can be followed by finally block later. \n\n finally - The "finally" block is used to execute the necessary code of the program. It is executed whether an exception is handled or not. \n\n throw - The "throw" keyword is used to throw an exception. \n\n throws - The "throws" keyword is used to declare exceptions. It specifies that there may occur an exception in the method. It doesn not throw an exception. It is always used with method signature.'
        'Common Scenarios of Java Exceptions\n\n 1) A scenario where ArithmeticException occurs\nIf we divide any number by zero, there occurs an ArithmeticException. \n\n 2) A scenario where NullPointerException occurs\nIf we have a null value in any variable, performing any operation on the variable throws a NullPointerException. \n\n 3) A scenario where NumberFormatException occurs\nIf the formatting of any variable or number is mismatched, it may result into NumberFormatException. Suppose we have a string variable that has characters; converting this variable into digit will cause NumberFormatException. \n\n 4) A scenario where ArrayIndexOutOfBoundsException occurs\nWhen an array exceeds to its size, the ArrayIndexOutOfBoundsException occurs. there may be other reasons to occur ArrayIndexOutOfBoundsException. Consider the following statements.'
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
          'Exception Handle',
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
      'question': 'What is a File in Java?',
      'options': [
        'An abstract data type representing a named location to store related information',
        'A class used to define methods for file operations',
        'A keyword used to create a new file'
      ],
      'correctAnswerIndex': 0,
      'selectedAnswerIndex': -1,
    },
    {
      'question': 'What are the two types of Streams in Java?',
      'options': [
        'Byte Stream and Character Stream',
        'Input Stream and Output Stream',
        'File Stream and Memory Stream'
      ],
      'correctAnswerIndex': 0,
      'selectedAnswerIndex': -1,
    },
    {
      'question': 'What is the purpose of Byte Stream in Java?',
      'options': [
        'To handle byte data in file operations',
        'To handle character data in file operations',
        'To handle file creation and deletion'
      ],
      'correctAnswerIndex': 0,
      'selectedAnswerIndex': -1,
    },
    {
      'question': 'How is Character Stream different from Byte Stream in Java?',
      'options': [
        'Character Stream handles character data while Byte Stream handles byte data',
        'Character Stream is faster than Byte Stream',
        'Character Stream is used for encryption while Byte Stream is used for decryption'
      ],
      'correctAnswerIndex': 0,
      'selectedAnswerIndex': -1,
    },
    {
      'question': 'What method is used to create a new file in Java?',
      'options': ['createNewFile()', 'writeToFile()', 'newFile()'],
      'correctAnswerIndex': 0,
      'selectedAnswerIndex': -1,
    },
    {
      'question': 'How can you read data from a file in Java?',
      'options': [
        'Using the Scanner class and its methods like hasNextLine() and nextLine()',
        'Using the BufferedReader class and its read() method',
        'Using the FileReader class and its readLine() method'
      ],
      'correctAnswerIndex': 0,
      'selectedAnswerIndex': -1,
    },
    {
      'question': 'Which method is used to delete a file in Java?',
      'options': ['delete()', 'remove()', 'erase()'],
      'correctAnswerIndex': 0,
      'selectedAnswerIndex': -1,
    },
    {
      'question':
          'What is the primary purpose of using streams in Java File Handling?',
      'options': [
        'To provide a way to read from and write to files',
        'To encrypt and decrypt files',
        'To compress and decompress files'
      ],
      'correctAnswerIndex': 0,
      'selectedAnswerIndex': -1,
    },
    {
      'question':
          'What does the createNewFile() method return if the file already exists?',
      'options': ['False', 'True', 'Null'],
      'correctAnswerIndex': 0,
      'selectedAnswerIndex': -1,
    },
    {
      'question':
          'Which stream should you use for handling text data in Java File Handling?',
      'options': ['Character Stream', 'Byte Stream', 'File Stream'],
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
