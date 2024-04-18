import 'package:flutter/material.dart';
import 'package:progpal/screens/java/modules/6_filehandle.dart';
import 'package:progpal/screens/java/modules/7_exceptionhandle.dart';
import 'package:progpal/screens/java/programs/applet.dart';
import 'package:progpal/screens/java/modules/5_oops.dart';
import 'package:progpal/screens/java/modules/1_introduction.dart';
import 'package:progpal/screens/java/modules/4_keywordslist.dart';
import 'package:progpal/screens/java/modules/2_features.dart';
import 'package:progpal/screens/java/modules/3_comparisions.dart';
import 'package:progpal/screens/java/programs/DataStructure.dart';
import 'package:progpal/screens/java/programs/array.dart';
import 'package:progpal/screens/java/programs/basic.dart';
import 'package:progpal/screens/java/programs/collection.dart';
import 'package:progpal/screens/java/programs/exception.dart';
import 'package:progpal/screens/java/programs/file_handling.dart';
import 'package:mind_map/mind_map.dart';
import 'package:progpal/screens/java/programs/oops.dart';
import 'package:progpal/screens/java/programs/pattern.dart';
import 'package:progpal/screens/java/programs/sorting.dart';
import 'package:progpal/screens/java/programs/threads.dart';
import 'package:progpal/screens/java/programs/recursion.dart';
import 'package:get/get.dart';

import 'programs/array.dart';
import 'programs/pybasic.dart';

Color bgColor = Colors.yellow;
Color txtColor = Colors.white;

class PyHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Python',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.indigo,
      ),
      body: DefaultTabController(
        length: 5, // Add one more tab for the RoadMap
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Align tabs to the start
          mainAxisAlignment: MainAxisAlignment.start, // Align tabs to the start
          children: [
            TabBar(
              tabAlignment: TabAlignment.center,
              isScrollable: true,
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: [
                Tab(text: 'Index'),
                Tab(text: 'Programs'),
                Tab(text: 'RoadMap'),
                Tab(text: 'Interview'),
                Tab(text: 'Description'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  IndexPage(),
                  ProgramsPage(),
                  RoadMapPage(),
                  InterviewPage(),
                  DescriptionPage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  bool _contentCompleted = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ExpansionTile(
          title: Row(
            children: [
              Text('Introduction to Java'),
              Spacer(),
              if (_contentCompleted)
                Icon(
                  Icons.check_circle,
                  color: Colors.green,
                ),
            ],
          ),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [],
            ),
            _buildDropdownMenuItem('What is Java?'),
            _buildDropdownMenuItem('Where is Java used?'),
            _buildDropdownMenuItem('How does Java work?'),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => JavaFirst()),
                ).then((value) {
                  // Update the state when the user completes the content
                  setState(() {
                    _contentCompleted = true;
                  });
                });
              },
              child: Text(
                'Start',
                style: TextStyle(color: Colors.white),
              ),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.indigo),
              ),
            ),
          ],
        ),
        ExpansionTile(
          title: Row(
            children: [
              Text('Features of Java'),
              Spacer(),
              if (_contentCompleted)
                Icon(
                  Icons.check_circle,
                  color: Colors.green,
                ),
            ],
          ),
          children: [
            _buildDropdownMenuItem('Variables'),
            _buildDropdownMenuItem('Data Types'),
            _buildDropdownMenuItem('Arithmetic Operations'),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => JavaSecond()),
                ).then((value) {
                  // Update the state when the user completes the content
                  setState(() {
                    _contentCompleted = true;
                  });
                });
              },
              child: Text(
                'Start',
                style: TextStyle(color: Colors.white),
              ),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.indigo),
              ),
            ),
          ],
        ),
        ExpansionTile(
          title: Row(
            children: [
              Text('JDK, JRE, and JVM'),
              Spacer(),
              if (_contentCompleted)
                Icon(
                  Icons.check_circle,
                  color: Colors.green,
                ),
            ],
          ),
          children: [
            _buildDropdownMenuItem('If-else Statements'),
            _buildDropdownMenuItem('Switch Statements'),
            _buildDropdownMenuItem('Ternary Operator'),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => JavaThird()),
                ).then((value) {
                  // Update the state when the user completes the content
                  setState(() {
                    _contentCompleted = true;
                  });
                });
              },
              child: Text(
                'Start',
                style: TextStyle(color: Colors.white),
              ),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.indigo),
              ),
            ),
          ],
        ),
        ExpansionTile(
          title: Row(
            children: [
              Text('List of Java Keywords'),
              Spacer(),
              if (_contentCompleted)
                Icon(
                  Icons.check_circle,
                  color: Colors.green,
                ),
            ],
          ),
          children: [
            _buildDropdownMenuItem('If-else Statements'),
            _buildDropdownMenuItem('Switch Statements'),
            _buildDropdownMenuItem('Ternary Operator'),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => JavaFourth()),
                ).then((value) {
                  // Update the state when the user completes the content
                  setState(() {
                    _contentCompleted = true;
                  });
                });
              },
              child: Text(
                'Start',
                style: TextStyle(color: Colors.white),
              ),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.indigo),
              ),
            ),
          ],
        ),
        ExpansionTile(
          title: Row(
            children: [
              Text('Java OOPs Concepts'),
              Spacer(),
              if (_contentCompleted)
                Icon(
                  Icons.check_circle,
                  color: Colors.green,
                ),
            ],
          ),
          children: [
            _buildDropdownMenuItem('If-else Statements'),
            _buildDropdownMenuItem('Switch Statements'),
            _buildDropdownMenuItem('Ternary Operator'),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => JavaFifth()),
                ).then((value) {
                  // Update the state when the user completes the content
                  setState(() {
                    _contentCompleted = true;
                  });
                });
              },
              child: Text(
                'Start',
                style: TextStyle(color: Colors.white),
              ),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.indigo),
              ),
            ),
          ],
        ),
        ExpansionTile(
          title: Row(
            children: [
              Text('Java File Handling'),
              Spacer(),
              if (_contentCompleted)
                Icon(
                  Icons.check_circle,
                  color: Colors.green,
                ),
            ],
          ),
          children: [
            _buildDropdownMenuItem('If-else Statements'),
            _buildDropdownMenuItem('Switch Statements'),
            _buildDropdownMenuItem('Ternary Operator'),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => JavaSixth()),
                ).then((value) {
                  // Update the state when the user completes the content
                  setState(() {
                    _contentCompleted = true;
                  });
                });
              },
              child: Text(
                'Start',
                style: TextStyle(color: Colors.white),
              ),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.indigo),
              ),
            ),
          ],
        ),
        ExpansionTile(
          title: Row(
            children: [
              Text('Java Exception Handling'),
              Spacer(),
              if (_contentCompleted)
                Icon(
                  Icons.check_circle,
                  color: Colors.green,
                ),
            ],
          ),
          children: [
            _buildDropdownMenuItem('If-else Statements'),
            _buildDropdownMenuItem('Switch Statements'),
            _buildDropdownMenuItem('Ternary Operator'),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => JavaSeventh()),
                ).then((value) {
                  // Update the state when the user completes the content
                  setState(() {
                    _contentCompleted = true;
                  });
                });
              },
              child: Text(
                'Start',
                style: TextStyle(color: Colors.white),
              ),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.indigo),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDropdownMenuItem(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(50)),
          color: Colors.indigo,
        ),
        child: DropdownMenuItem(
          child: Text(
            title,
            style: TextStyle(color: txtColor),
          ),
        ),
      ),
    );
  }
}

Widget _buildDropdownMenuItem(String title) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(50)),
        color: bgColor,
      ),
      child: DropdownMenuItem(
        child: Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
      ),
    ),
  );
}

// Roadmap
class RoadMapPage extends StatelessWidget {
  const RoadMapPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SingleChildScrollView(
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: bgColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10)
                          .copyWith(right: 0),
                  margin: const EdgeInsets.only(left: 10),
                  child: const Text('Python  '),
                ),
                MindMap(
                  padding: const EdgeInsets.only(left: 50),
                  dotRadius: 4,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Navigate to BasicPage on tap
                            Get.to(JavaFirst());
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: bgColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            margin: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10)
                                .copyWith(right: 0),
                            child: const Text('Basic'),
                          ),
                        ),
                        MindMap(
                          dotRadius: 4,
                          children: [
                            GestureDetector(
                              onTap: () {
                                // Navigate to ConditionalPage on tap
                                // Get.to(ConditionalPage());
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: bgColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10),
                                margin: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10),
                                child: const Text('Conditional'),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                // Navigate to VariablesPage on tap
                                // Get.to(VariablesPage());
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: bgColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10),
                                margin: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10),
                                child: const Text('Variables'),
                              ),
                            ),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    // Navigate to FunctionsPage on tap
                                    // Get.to(FunctionsPage());
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: bgColor,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 10),
                                    margin: const EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 10)
                                        .copyWith(right: 0),
                                    child: const Text(
                                      'Functions',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        // Navigate to ExceptionHandlingPage on tap
                        // Get.to(ExceptionHandlingPage());
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: bgColor,
                            borderRadius: BorderRadius.circular(10)),
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        margin: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        child: const Text('Exception Handling'),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Navigate to DataStructurePage on tap
                        // Get.to(DataStructurePage());
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: bgColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        margin: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        child: const Text('Data Structure'),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Navigate to OOPPage on tap
                        // Get.to(OOPPage());
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: bgColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        margin: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        child: const Text('OOP'),
                      ),
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Navigate to FileHandlingPage on tap
                            // Get.to(FileHandlingPage());
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: bgColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            margin: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10)
                                .copyWith(right: 0),
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            child: const Text('File Handling'),
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Description
class DescriptionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'What will I learn?',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0),
              Text('• Understand and implement basic Python Code'),
              Text(
                  '• Solid understanding of python programming fundamentals such as data types and structure, variables,loops and functions'),
              SizedBox(height: 16.0),
              Text(
                'Who is the target audience?',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                  '• This course is perfect for absolute beginners with no previous coding experience, to intermediate looking to sharpen their skills to the expert level.'),
              Text(
                  '• People Who want to learn Python Fundamentals and later transition into DataScience, Web Development or Big Data'),
              Text(
                  '• Those who love letting their own creative genius shine whilst getting paid to do so'),
              SizedBox(height: 16.0),
              Text(
                'Benefits',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                  '• Python is one of the most important programming languages and must be part of any programming toolset.'),
              SizedBox(height: 16.0),
              Text(
                  '• Once you learn Python, you will never have a shortage of ways to utilize the skill.'),
              SizedBox(height: 16.0),
              Text('• Python is popular and widely used'),
              SizedBox(height: 16.0),
              Text(
                'Salary',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0),
              Text('• The median salary is 1,24,787 USD per year'),
              SizedBox(height: 16.0),
              Text(
                'Requirements',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                  '• A strong work ethic, willingness to learn and plenty of excitement about the awesome new programs  your about to build'),
              SizedBox(height: 16.0),
              Text(
                  '• Nothing else, its just you, your phone and your hunger to get started today'),
              SizedBox(height: 16.0),
              Text('• Consistency is key to success'),
            ],
          ),
        ),
      ),
    );
  }
}

class InterviewPage extends StatefulWidget {
  @override
  _InterviewPageState createState() => _InterviewPageState();
}

class _InterviewPageState extends State<InterviewPage> {
  TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  bool _isSearching = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10.0),
            if (!_isSearching)
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0),
                  ),
                ),
                child: ListTile(
                  title: Center(
                    child: Text(
                      'Interview Questions',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.search),
                    color: Colors.white,
                    onPressed: () {
                      setState(() {
                        _isSearching = true;
                      });
                    },
                  ),
                ),
              ),
            if (_isSearching)
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Search for questions...',
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide.none,
                    ),
                    prefixIcon: IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        setState(() {
                          _isSearching = false;
                          _searchController.clear();
                          _searchQuery = '';
                        });
                      },
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _searchQuery = value;
                    });
                  },
                ),
              ),
            SizedBox(height: 10.0), // Adding SizedBox here
            ..._buildQuestions(context),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildQuestions(BuildContext context) {
    List<Widget> questionWidgets = [];

    questionWidgets.add(_buildQuestion(
      context,
      1,
      'What is Python? What are the benefits of using Python',
      'Python is an interpreted language. It is not a hybrid language, like languages that combine elements of both compiled and interpreted languages. In Python, the code is executed line by line by the Python interpreter.',
    ));

    questionWidgets.add(_buildQuestion(
      context,
      2,
      'Python is an interpreted language or a hybrid language. Explain?',
      'Python is an interpreted language. It is not a hybrid language, like languages that combine elements of both compiled and interpreted languages. In Python, the code is executed line by line by the Python interpreter.',
    ));
    questionWidgets.add(_buildQuestion(
      context,
      3,
      'How is memory managed in Python?',
      '• Python makes use of automatic memory management through garbage collection.\n• The garbage collector keeps track of objects and frees memory when they are no longer in use.\n• Python uses reference counting to manage memory, incrementing and decrementing reference counts as needed.\n• A cyclic garbage collector handles objects with circular references.\n• Python also provides tools like context managers and the “with” statement to release resources automatically.\n• Python’s memory management simplifies coding by handling memory allocation and deallocation automatically.',
    ));
    questionWidgets.add(_buildQuestion(
      context,
      4,
      'What Advantage Does the Numpy Array Have over a Nested List?',
      'Numpy is written in C so that all its complexities are backed into a simple to use a module. Lists, on the other hand, are dynamically typed. Therefore, Python must check the data type of each element every time it uses it. This makes Numpy arrays much faster than lists. Numpy has a lot of additional functionality that list doesn’t offer; for instance, a lot of things can be automated in Numpy',
    ));
    questionWidgets.add(_buildQuestion(
      context,
      5,
      'How Do You Get Indices of N Maximum Values in a Numpy Array?',
      '>>import numpy as np \n>>arr=np.array([1, 3, 2, 4, 5]) \n>>print(arr.argsort( ) [ -N: ][: : -1])',
    ));
    questionWidgets.add(_buildQuestion(
      context,
      6,
      'What is the difference between JDK, JRE, and JVM?',
      'JVM \n \nJVM is an acronym for Java Virtual Machine; it is an abstract machine which provides the runtime environment in which Java bytecode can be executed. It is a specification which specifies the working of Java Virtual Machine. Its implementation has been provided by Oracle and other companies. Its implementation is known as JRE.\n JVMs are available for many hardware and software platforms (so JVM is platform dependent). It is a runtime instance which is created when we run the Java class. There are three notions of the JVM: specification, implementation, and instance. \n \nJRE \n \n JRE stands for Java Runtime Environment. It is the implementation of JVM. The Java Runtime Environment is a set of software tools which are used for developing Java applications. It is used to provide the runtime environment. It is the implementation of JVM. It physically exists. It contains a set of libraries + other files that JVM uses at runtime. \n\nJDK \n\nJDK is an acronym for Java Development Kit. It is a software development environment which is used to develop Java applications and applets. It physically exists. It contains JRE + development tools. JDK is an implementation of any one of the below given Java Platforms released by Oracle Corporation:\n ○ Standard Edition Java Platform \n ○ Enterprise Edition Java Platform \n ○ Micro Edition Java Platform',
    ));
    questionWidgets.add(_buildQuestion(
      context,
      7,
      'How many types of memory areas are allocated by JVM?',
      'Class(Method) Area: Class Area stores per-class structures such as the runtime constant pool, field, method data, and the code for methods.\nHeap: It is the runtime data area in which the memory is allocated to the objects. \nStack: Java Stack stores frames. It holds local variables and partial results, and plays a part in method invocation and return. Each thread has a private JVM stack, created at the same time as the thread. A new frame is created each time a method is invoked. A frame is destroyed when its method invocation completes.\nProgram Counter Register: PC (program counter) register contains the address of the Java virtual machine instruction currently being executed.\nNative Method Stack: It contains all the native methods used in the application',
    ));
    questionWidgets.add(_buildQuestion(
      context,
      8,
      'Difference between Heap and Stack Memory in java. And how java utilizes this.',
      'Stack memory is the portion of memory that was assigned to every individual program. And it was fixed. On the other hand, Heap memory is the portion that was not allocated to the java program but it will be available for use by the java program when it is required, mostly during the runtime of the program.\n\nJava Utilizes this memory as - \nWhen we write a java program then all the variables, methods, etc are stored in the stack memory.And when we create any object in the java program then that object was created in the heap memory. And it was referenced from the stack memory.',
    ));
    questionWidgets.add(_buildQuestion(
      context,
      9,
      'Explain public static void main(String args[]) in Java.',
      'public: the public is the access modifier responsible for mentioning who can access the element or the method and what is the limit.  It is responsible for making the main function globally available. It is made public so that JVM can invoke it from outside the class as it is not present in the current class.\n\nstatic: static is a keyword used so that we can use the element without initiating the class so to avoid the unnecessary allocation of the memory.\n\nvoid: void is a keyword and is used to specify that a method doesn’t return anything. As the main function doesn’t return anything we use void. \n\nmain: main represents that the function declared is the main function. It helps JVM to identify that the declared function is the main function.\n\nString args[]: It stores Java command-line arguments and is an array of type java.lang.String class.',
    ));
    questionWidgets.add(_buildQuestion(
      context,
      10,
      'Explain different data types in Java.',
      'There are 2 types of data types in Java as mentioned below:\n①Primitive Data Type\n②Non-Primitive Data Type\n\nPrimitive Data Type:\n•boolean: stores value true or false\n•byte: stores an 8-bit signed two’s complement integer\n•char: stores a single 16-bit Unicode character\n•short: stores a 16-bit signed two’s complement integer\n•int: stores a 32-bit signed two’s complement integer\n•long: stores a 64-bit two’s complement integer\n•float: stores a single-precision 32-bit IEEE 754 floating-point\n•double: stores a double-precision 64-bit IEEE 754 floating-point \n\nNon-Primitive Data Type:Reference Data types will contain a memory address of the variable’s values because it is not able to directly store the values in the memory.\n•Strings\n•Array\n•Class\n•Object\n•Interface',
    ));
    questionWidgets.add(_buildQuestion(
      context,
      11,
      'What are the various access specifiers in Java?',
      'In Java, access specifiers are the keywords which are used to define the access scope of the method, class, or a variable.\n\n○Public The classes, methods, or variables which are defined as public, can be accessed by any class or method.\n\n○Protected Protected can be accessed by the class of the same package, or by the sub-class of this class, or within the same class.\n\n○Default Default are accessible within the package only. By default, all the classes, methods, and variables are of default scope.\n\n○Private The private class, methods, or variables defined as private can be accessed within the class only.',
    ));
    questionWidgets.add(_buildQuestion(
      context,
      12,
      'What is the constructor?',
      'The constructor can be defined as the special type of method that is used to initialize the state of an object. It is invoked when the class is instantiated, and the memory is allocated for the object. Every time, an object is created using the new keyword, the default constructor of the class is called. The name of the constructor must be similar to the class name. The constructor must not have an explicit return type.',
    ));
    questionWidgets.add(_buildQuestion(
      context,
      13,
      'How many types of constructors are used in Java?',
      '○ Default Constructor: default constructor is the one which does not accept any value. The default constructor is mainly used to initialize the instance variable with the default values. It can also be used for performing some useful task on object creation. A default constructor is invoked implicitly by the compiler if there is no constructor defined in the class.\n○ Parameterized Constructor: The parameterized constructor is the one which can initialize the instance variables with the given values. In other words, we can say that the constructors which can accept the arguments are called parameterized constructors.',
    ));
    questionWidgets.add(_buildQuestion(
      context,
      14,
      'What is this keyword in java?',
      'The this keyword is a reference variable that refers to the current object. There are the various uses of this keyword in Java. It can be used to refer to current class properties such as instance methods, variable, constructors, etc. It can also be passed as an argument into the methods or constructors. It can also be returned from the method as the current class instance.',
    ));

    return questionWidgets;
  }

  Widget _buildQuestion(
      BuildContext context, int number, String question, String answer) {
    // Check if the question contains the search query
    if (_isSearching &&
        _searchQuery.isNotEmpty &&
        !question.toLowerCase().contains(_searchQuery.toLowerCase())) {
      return SizedBox(); // If searching and question doesn't match search query, return empty SizedBox
    }

    return Container(
      margin: EdgeInsets.only(bottom: 16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 4,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: SingleChildScrollView(
        child: ExpansionTile(
          title: Row(
            children: [
              Text(
                '$number. ',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Flexible(
                child: Text(
                  question,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                answer,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProgramsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildProgramsGridView(context),
          ],
        ),
      ),
    );
  }

  Widget buildProgramsGridView(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 2,
      padding: EdgeInsets.all(16.0),
      crossAxisSpacing: 16.0,
      mainAxisSpacing: 16.0,
      physics: NeverScrollableScrollPhysics(),
      children: [
        buildProgramCard(
          context,
          'Array',
          'assets/images/java/array.png',
          Parray(),
        ),
        buildProgramCard(
          context,
          'Basic',
          'assets/images/java/helloworld.png',
          PBasic(),
        ),
        buildProgramCard(
          context,
          'Collection',
          'assets/images/java/collection.png',
          CollectionPage(),
        ),
        buildProgramCard(
          context,
          'Data Structure',
          'assets/images/java/ds.png',
          DataStructure(),
        ),
        buildProgramCard(
          context,
          'Exception Handling',
          'assets/images/java/exception.png',
          ExceptionPage(),
        ),
        buildProgramCard(
          context,
          'File Handling',
          'assets/images/java/filehandling.png',
          FileHandling(),
        ),
        buildProgramCard(
          context,
          'OOPs',
          'assets/images/java/oop.png',
          OopsPage(),
        ),
        buildProgramCard(
          context,
          'Pattern',
          'assets/images/java/pattern.png',
          PatternPage(),
        ),
        buildProgramCard(
          context,
          'Recursion',
          'assets/images/java/recursion.png',
          Recursion(),
        ),
        buildProgramCard(
          context,
          'Sorting',
          'assets/images/java/sort.png',
          Sorts(),
        ),
        buildProgramCard(
          context,
          'Threads',
          'assets/images/java/thread.png',
          Threads(),
        ),
      ],
    );
  }

  Widget buildProgramCard(
      BuildContext context, String title, String imagePath, Widget page) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Card(
        elevation: 4.0,
        child: buildCardContent(title, imagePath),
      ),
    );
  }

  Widget buildCardContent(String title, String imagePath) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Center(
            child: Image.asset(
              imagePath,
              width: 180, // Adjust the width as needed
              height: 140, // Adjust the height as needed
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 8.0),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
