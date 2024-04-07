import 'package:flutter/material.dart';
import 'package:progpal/screens/java/beginner_screen.dart';

class JavaSeventh extends StatefulWidget {
  const JavaSeventh({Key? key}) : super(key: key);

  @override
  State<JavaSeventh> createState() => _JavaSeventhState();
}

class _JavaSeventhState extends State<JavaSeventh> {
  List<String> contents = [
    'Java File Handling',
    'In Java, a File is an abstract data type. A named location used to store related information is known as a File. There are several File Operations like creating a new File, getting information about File, writing into a File, reading from a File and deleting a File.'
        'Stream\n\nA series of data is referred to as a stream. In Java, Stream is classified into two types, i.e., Byte Stream and Character Stream. \n\nByte Stream\n Byte Stream is mainly involved with byte data. A file handling process with a byte stream is a process in which an input is provided and executed with the byte data. \n\nCharacter Stream\nCharacter Stream is mainly involved with character data. A file handling process with a character stream is a process in which an input is provided and executed with the character data.'
        'File Operations\nWe can perform the following operation on a file:\nCreate a File\nGet File Information\nWrite to a File\nRead from a File\nDelete a File'
        'Create a File\nCreate a File operation is performed to create a new file. We use the createNewFile() method of file. The createNewFile() method returns true when it successfully creates a new file and returns false when the file already exists.'
        'Read from a File\nThe next operation which we can perform on a file is "read from a file". In order to write data into a file, we will use the Scanner class. Here, we need to close the stream using the close() method. We will create an instance of the Scanner class and use the hasNextLine() method nextLine() method to get data from the file.'
        'Delete a File\nThe next operation which we can perform on a file is "deleting a file". In order to delete a file, we will use the delete() method of the file. We don nott need to close the stream using the close() method because for deleting a file, we neither use the FileWriter class nor the Scanner class.'
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
