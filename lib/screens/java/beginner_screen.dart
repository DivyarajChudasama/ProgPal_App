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

import 'programs/Miscellaneous.dart';
import 'programs/swing.dart';
// import 'package:flutter_tts/flutter_tts.dart';

Color bgColor = Colors.yellow;
Color txtColor = Colors.white;

class BeginnerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Java',
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
  int _completedCount = 0;
  final int _totalSections = 7;
  Map<String, bool> _moduleCompletionStatus = {
    'JavaFirst': false,
    'JavaSecond': false,
    'JavaThird': false,
    'JavaFourth': false,
    'JavaFifth': false,
    'JavaSixth': false,
    'JavaSeventh': false,
  };

  void _updateProgress(String routeName) {
    if (!_moduleCompletionStatus[routeName]!) {
      setState(() {
        _completedCount++;
        _moduleCompletionStatus[routeName] = true;
      });
    }
  }

  Widget _buildIconButton(String title, bool isCompleted, String routeName) {
    return IconButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => routeName == 'JavaFirst'
                ? JavaFirst()
                : routeName == 'JavaSecond'
                    ? JavaSecond()
                    : routeName == 'JavaThird'
                        ? JavaThird()
                        : routeName == 'JavaFourth'
                            ? JavaFourth()
                            : routeName == 'JavaFifth'
                                ? JavaFifth()
                                : routeName == 'JavaSixth'
                                    ? JavaSixth()
                                    : JavaSeventh(),
          ),
        ).then((value) {
          _updateProgress(routeName);
        });
      },
      icon: Icon(isCompleted ? Icons.play_arrow : Icons.play_circle_fill),
      color: Colors.indigo,
    );
  }

  Widget _buildModuleTile(String title, bool isCompleted, String routeName) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          LinearProgressIndicator(
            value: _moduleCompletionStatus[routeName]! ? 1.0 : 0.0,
            backgroundColor: Colors.grey[300],
            valueColor: AlwaysStoppedAnimation<Color>(Colors.indigo),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 16),
              ),
              Spacer(),
              _buildIconButton(title, isCompleted, routeName),
              if (_moduleCompletionStatus[routeName]!)
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Icon(
                    Icons.check_circle,
                    color: Colors.green,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _buildModuleTile('Introduction to Java',
            _moduleCompletionStatus['JavaFirst']!, 'JavaFirst'),
        _buildModuleTile('Features of Java',
            _moduleCompletionStatus['JavaSecond']!, 'JavaSecond'),
        _buildModuleTile('JDK, JRE, and JVM',
            _moduleCompletionStatus['JavaThird']!, 'JavaThird'),
        _buildModuleTile('List of Java Keywords',
            _moduleCompletionStatus['JavaFourth']!, 'JavaFourth'),
        _buildModuleTile('Java OOPs Concepts',
            _moduleCompletionStatus['JavaFifth']!, 'JavaFifth'),
        _buildModuleTile('Java File Handling',
            _moduleCompletionStatus['JavaSixth']!, 'JavaSixth'),
        _buildModuleTile('Java Exception Handling',
            _moduleCompletionStatus['JavaSeventh']!, 'JavaSeventh'),
      ],
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
                  child: const Text('Java  '),
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
                        Get.to(JavaSeventh());
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
                        Get.to(JavaFifth());
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
                            Get.to(JavaSixth());
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
              Text('• Core concepts in java(whilst having fun,too)'),
              Text(
                  '• How to easily write programs for all computing platforms at once'),
              Text(
                  '• Knowledge of java code(+advance tips and tricks used by pros)'),
              Text(
                  '• The core skills needed to program for big clients, as a travelling freelaner or from home'),
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
                  '• Those looking to build creative and advanced java app for either personal use or for high-paying clients as a self employed contrator'),
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
                  '• Java is quite popular as a Programming Language in the industry so you can get good opportunities, if that is what you are looking for'),
              SizedBox(height: 16.0),
              Text(
                  '• Java is secure platform, thanks to its virtual Machine.This is one of the primary reasons Companies worldwide are using this language.'),
              SizedBox(height: 16.0),
              Text(
                  '• Android app development is gaining momentum and if you are familar with java then learning Andriod will be easier for you'),
              SizedBox(height: 16.0),
              Text(
                'Salary',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0),
              Text('• The median salary is 102,000 USD per year'),
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
      'Is Java Platform Independent if then how?',
      'Yes, Java is a Platform Independent language. Unlike many programming languages javac compiler compiles the program to form a bytecode or .class file. This file is independent of the software or hardware running but needs a JVM(Java Virtual Machine) file preinstalled in the operating system for further execution of the bytecode.Although JVM is platform dependent, the bytecode can be created on any System and can be executed in any other system despite hardware or software being used which makes Java platform independent.',
    ));

    questionWidgets.add(_buildQuestion(
      context,
      2,
      'What are the features of Java?',
      'Simple: Java is easy to learn. The syntax of Java is based on C++ which makes easier to write the program in it. \n Object-Oriented: Java follows the object-oriented paradigm which allows us to maintain our code as the combination of different type of objects that incorporates both data and behavior. \n Portable: Java supports read-once-write-anywhere approach. We can execute the Java program on every machine. Java program (.java) is converted to bytecode (.class) which can be easily run on every machine.\n Platform Independent: Java is a platform independent programming language. It is different from other programming languages like C and C++ which needs a platform to be executed. Java comes with its platform on which its code is executed. Java does not depend upon the operating system to be executed.\n Secured: Java is secured because it does not use explicit pointers. Java also provides the concept of ByteCode and Exception handling which makes it more secured.\n Robust: Java is a strong programming language as it uses strong memory management. The concepts like Automatic garbage collection, Exception handling, etc. make it more robust.\n Architecture Neutral: Java is architectural neutral as it is not dependent on the architecture. In C, the size of data types may vary according to the architecture (32 bit or 64 bit) which does not exist in Java. \n  Interpreted: Java uses the Just-in-time (JIT) interpreter along with the compiler for the program execution. High Performance: Java is faster than other traditional interpreted programming languages because Java bytecode is "close" to native code. It is still a little bit slower than a compiled language (e.g., C++).  \n Multithreaded: We can write Java programs that deal with many tasks at once by defining multiple threads. The main advantage of multi-threading is that it does not occupy memory for each thread. It shares a common memory area. Threads are important for multi-media, Web applications, etc.\n Distributed: Java is distributed because it facilitates users to create distributed applications in Java. RMI and EJB are used for creating distributed applications. This feature of Java makes us able to access files by calling the methods from any machine on the internet.\n Dynamic: Java is a dynamic language. It supports dynamic loading of classes. It means classes are loaded on demand. It also supports functions from its native languages, i.e., C and C++.ne which calls the main method present in the Java code. JVM is the specification which must be implemented in the computer system. The Java code is compiled by JVM to be a Bytecode which is machine independent and close to the native code.',
    ));
    questionWidgets.add(_buildQuestion(
      context,
      3,
      'What is JVM?',
      'Java Virtual Machine is a virtual machine that enables the computer to run the Java program. JVM acts like a run-time engine which calls the main method present in the Java code. JVM is the specification which must be implemented in the computer system. The Java code is compiled by JVM to be a Bytecode which is machine independent and close to the native code.',
    ));
    questionWidgets.add(_buildQuestion(
      context,
      4,
      'What is the difference between JDK, JRE, and JVM?',
      'JVM \n \nJVM is an acronym for Java Virtual Machine; it is an abstract machine which provides the runtime environment in which Java bytecode can be executed. It is a specification which specifies the working of Java Virtual Machine. Its implementation has been provided by Oracle and other companies. Its implementation is known as JRE.\n JVMs are available for many hardware and software platforms (so JVM is platform dependent). It is a runtime instance which is created when we run the Java class. There are three notions of the JVM: specification, implementation, and instance. \n \nJRE \n \n JRE stands for Java Runtime Environment. It is the implementation of JVM. The Java Runtime Environment is a set of software tools which are used for developing Java applications. It is used to provide the runtime environment. It is the implementation of JVM. It physically exists. It contains a set of libraries + other files that JVM uses at runtime. \n\nJDK \n\nJDK is an acronym for Java Development Kit. It is a software development environment which is used to develop Java applications and applets. It physically exists. It contains JRE + development tools. JDK is an implementation of any one of the below given Java Platforms released by Oracle Corporation:\n ○ Standard Edition Java Platform \n ○ Enterprise Edition Java Platform \n ○ Micro Edition Java Platform',
    ));
    questionWidgets.add(_buildQuestion(
      context,
      5,
      'Why is Java not a pure object oriented language?',
      'Java supports primitive data types - byte, boolean, char, short, int, float, long, and double and hence it is not a pure object oriented language.',
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
      ' Difference between Heap and Stack Memory in java. And how java utilizes this.',
      'Stack memory is the portion of memory that was assigned to every individual program. And it was fixed. On the other hand, Heap memory is the portion that was not allocated to the java program but it will be available for use by the java program when it is required, mostly during the runtime of the program.\n\nJava Utilizes this memory as - \nWhen we write a java program then all the variables, methods, etc are stored in the stack memory.And when we create any object in the java program then that object was created in the heap memory. And it was referenced from the stack memory.',
    ));
    questionWidgets.add(_buildQuestion(
      context,
      9,
      ' Explain public static void main(String args[]) in Java.',
      'public: the public is the access modifier responsible for mentioning who can access the element or the method and what is the limit.  It is responsible for making the main function globally available. It is made public so that JVM can invoke it from outside the class as it is not present in the current class.\n\nstatic: static is a keyword used so that we can use the element without initiating the class so to avoid the unnecessary allocation of the memory.\n\nvoid: void is a keyword and is used to specify that a method doesn’t return anything. As the main function doesn’t return anything we use void. \n\nmain: main represents that the function declared is the main function. It helps JVM to identify that the declared function is the main function.\n\nString args[]: It stores Java command-line arguments and is an array of type java.lang.String class.',
    ));
    questionWidgets.add(_buildQuestion(
      context,
      10,
      '  Explain different data types in Java.',
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
      ' How many types of constructors are used in Java?',
      '○ Default Constructor: default constructor is the one which does not accept any value. The default constructor is mainly used to initialize the instance variable with the default values. It can also be used for performing some useful task on object creation. A default constructor is invoked implicitly by the compiler if there is no constructor defined in the class.\n○ Parameterized Constructor: The parameterized constructor is the one which can initialize the instance variables with the given values. In other words, we can say that the constructors which can accept the arguments are called parameterized constructors.',
    ));
    questionWidgets.add(_buildQuestion(
      context,
      14,
      ' What is this keyword in java?',
      'The this keyword is a reference variable that refers to the current object. There are the various uses of this keyword in Java. It can be used to refer to current class properties such as instance methods, variable, constructors, etc. It can also be passed as an argument into the methods or constructors. It can also be returned from the method as the current class instance.',
    ));
    questionWidgets.add(_buildQuestion(
      context,
      15,
      ' What is object-oriented programming(OOPs)?',
      'Object-oriented programming (OOP) is a programming paradigm that is based on the concept of objects. In OOP, programs are organized around objects, which have properties (attributes) and behaviors (methods). OOP emphasizes encapsulation, inheritance, polymorphism, and abstraction.',
    ));
    questionWidgets.add(_buildQuestion(
      context,
      16,
      'What is the Inheritance?',
      'Inheritance is a mechanism by which one object acquires all the properties and behavior of another object of another class. It is used for Code Reusability and Method Overriding. The idea behind inheritance in Java is that you can create new classes that are built upon existing classes. When you inherit from an existing class, you can reuse methods and fields of the parent class. Moreover, you can add new methods and fields in your current class also. Inheritance represents the IS-A relationship which is also known as a parent-child relationship.\n\n There are five types of inheritance in Java:\n○Single-level inheritance\n○Multi-level inheritance\n○Multiple Inheritance\n○Hierarchical Inheritance\n○Hybrid Inheritance',
    ));
    questionWidgets.add(_buildQuestion(
      context,
      17,
      'Why is Inheritance used in Java?',
      '○Inheritance provides code reusability. The derived class does not need to redefine the method of base class unless it needs to provide the specific implementation of the method.\n○Runtime polymorphism cannot be achieved without using inheritance.\n○We can simulate the inheritance of classes with the real-time objects which makes OOPs more realistic.\n○Inheritance provides data hiding. The base class can hide some data from the derived class by making it private.\n○Method overriding cannot be achieved without inheritance. By method overriding, we can give a specific implementation of some basic method contained by the base class.',
    ));
    questionWidgets.add(_buildQuestion(
      context,
      18,
      'What do you mean by data encapsulation?',
      '• Data Encapsulation is an Object-Oriented Programming concept of hiding the data attributes and their behaviours in a single unit.\n• It helps developers to follow modularity while developing software by ensuring that each object is independent of other objects by having its own methods, attributes, and functionalities.\n• It is used for the security of the private properties of an object and hence serves the purpose of data hiding.',
    ));
    questionWidgets.add(_buildQuestion(
      context,
      19,
      'What is polymorphism?',
      'Polymorphism is defined as the ability to take more than one form It is of two types namely, Compile time polymorphism or method overloading- a function called during compile time. For instance, take a class ‘area’. Based on the number of parameters it may calculate the area of a square, triangle, or circle. Run time polymorphism or method overriding- links during run time.  The method inside a class overrides the method of the parent class.',
    ));
    questionWidgets.add(_buildQuestion(
      context,
      20,
      'What is abstraction?',
      'Abstraction refers to the act of representing essential features without including background details. The detailed information or the implementation is hidden. The most common example of abstraction is a car, we know how to turn on the engine, accelerate and move, however, the way engine works, and its internal components are complex logic hidden from the general users. This is usually done to handle the complexity.',
    ));
    questionWidgets.add(_buildQuestion(
      context,
      21,
      'What is the Wrapper class in Java?',
      'Wrapper, in general, is referred to a larger entity that encapsulates a smaller entity. Here in Java, the wrapper class is an object class that encapsulates the primitive data types. \nThe primitive data types are the ones from which further data types could be created. For example, integers can further lead to the construction of long, byte, short, etc. On the other hand, the string cannot, hence it is not primitive. \nGetting back to the wrapper class, Java contains 8 wrapper classes. They are Boolean, Byte, Short, Integer, Character, Long, Float, and Double. Further, custom wrapper classes can also be created in Java which is similar to the concept of Structure in the C programming language. We create our own wrapper class with the required data types.',
    ));
    questionWidgets.add(_buildQuestion(
      context,
      22,
      'What is method overriding?',
      'Method overriding, also known as run time polymorphism is one where the child class contains the same method as the parent class. For instance, we have a method named ‘progpal()’ in the parent class. A method progpal() is again defined in the sub-class. Thus when progpal() is called in the subclass, the method within the class id executed. Here, progpal() within the class overridden the method outside. ',
    ));
    questionWidgets.add(_buildQuestion(
      context,
      23,
      'What is method overloading?',
      'Method overriding is a method to achieve Run-time polymorphism in Java. Method overriding is a feature that allows a child class to provide a specific implementation of a method that is already provided by one of its parent classes. When a method in a child class has the same name, the same parameters or signature, and the same return type(or sub-type) as a method in its parent class, then the method in the subclass is said to override the method in the superclass.',
    ));
    questionWidgets.add(_buildQuestion(
      context,
      24,
      'Why is StringBuffer called mutable?',
      'StringBuffer class in Java is used to represent a changeable string of characters. It offers an alternative to the immutable String class by enabling you to change a string’s contents without constantly creating new objects. Mutable (modifiable) strings are created with the help of the StringBuffer class. The StringBuffer class in Java is identical to the String class except that it is changeable.',
    ));
    questionWidgets.add(_buildQuestion(
      context,
      25,
      'What is an array in Java?',
      'An Array in Java is a data structure that is used to store a fixed-size sequence of elements of the same type. Elements of an array can be accessed by their index, which starts from 0 and goes up to a length of minus 1. Array declaration in Java is done with the help of square brackets and size is also specified during the declaration. ',
    ));
    questionWidgets.add(_buildQuestion(
      context,
      26,
      'On which memory arrays are created in Java?',
      'Arrays in Java are created in heap memory. When an array is created with the help of a new keyword, memory is allocated in the heap to store the elements of the array. In Java, the heap memory is managed by the Java Virtual Machine(JVM) and it is also shared between all threads of the Java Program. The memory which is no longer in use by the program, JVM uses a garbage collector to reclaim the memory. Arrays in Java are created dynamically which means the size of the array is determined during the runtime of the program. The size of the array is specified during the declaration of the array and it cannot be changed once the array is created.',
    ));
    questionWidgets.add(_buildQuestion(
      context,
      27,
      'What do you understand by the jagged array?',
      'A jagged Array in Java is just a two-dimensional array in which each row of the array can have a different length. Since all the rows in a 2-d Array have the same length but a jagged array allows more flexibility in the size of each row. This feature is very useful in conditions where the data has varying lengths or when memory usage needs to be optimized.   ',
    ));
    questionWidgets.add(_buildQuestion(
      context,
      28,
      'What are Classes in Java? ',
      'In Java, Classes are the collection of objects sharing similar characteristics and attributes. Classes represent the blueprint or template from which objects are created.  Classes are not real-world entities but help us to create objects which are real-world entities.',
    ));
    questionWidgets.add(_buildQuestion(
      context,
      29,
      'What is an Interface?',
      'An interface in Java is a collection of static final variables and abstract methods that define the contract or agreement for a set of linked classes. Any class that implements an interface is required to implement a specific set of methods. It specifies the behavior that a class must exhibit but not the specifics of how it should be implemented.',
    ));
    questionWidgets.add(_buildQuestion(
      context,
      30,
      'Can we override the private methods?',
      'It is not possible to override the private methods in Java. Method overriding is where the method in the subclass is implemented instead of the method from the parent class. The private methods are accessible only within the class in which it is declared. Since this method is not visible to other classes and cannot be accessed, it cannot be overridden. ',
    ));
    questionWidgets.add(_buildQuestion(
      context,
      31,
      'What is the difference between an abstract class and an interface?',
      'An abstract class can have both abstract and non-abstract methods and can beextended by other classes, while an interface only contains abstract methoddeclarations and can be implemented by classes.',
    ));
    questionWidgets.add(_buildQuestion(
      context,
      32,
      'What is the use of the final keyword?',
      'The final keyword is used to make functions non-virtual. By default, all the functions are virtual so to make it non-virtual we use the final keyword.',
    ));
    questionWidgets.add(_buildQuestion(
      context,
      33,
      'What is the Stack class in Java and what are the various methods provided by it?',
      'A Stack class in Java is a LIFO data structure that implements the Last In First Out data structure. It is derived from a Vector class but has functions specific to stacks. The Stack class in java provides the following methods:\n• peek(): returns the top item from the stack without removing it \n• empty(): returns true if the stack is empty and false otherwise\n• push(): pushes an item onto the top of the stack\n• pop(): removes and returns the top item from the stack\n• search(): returns the 1, based position of the object from the top of the stack. If the object is not in the stack, it returns -1',
    ));
    questionWidgets.add(_buildQuestion(
      context,
      34,
      'What is Set in the Java Collections framework and list down its various implementations?',
      'Sets are collections that don’t store duplicate elements. They don’t keep any order of the elements. The Java Collections framework provides several implementations of the Set interface, including: \n• HashSet: HashSet in Java, stores the elements in a has table which provides faster lookups and faster insertion. HashSet is not ordered.\n• LinkedHashSet: LinkedHashSet is an implementation of HashSet which maintains the insertion order of the elements.\n• TreeSet: TreeSet stores the elements in a sorted order that is determined by the natural ordering of the elements or by a custom comparator provided at the time of creation.',
    ));
    questionWidgets.add(_buildQuestion(
      context,
      35,
      'What is the HashSet class in Java and how does it store elements?',
      'The HashSet class implements the Set interface in the Java Collections Framework and is a member of the HashSet class. Unlike duplicate values, it stores a collection of distinct elements. In this implementation, each element is mapped to an index in an array using a hash function, and the index is used to quickly access the element. It produces an index for the element in the array where it is stored based on the input element. Assuming the hash function distributes the elements among the buckets appropriately, the HashSet class provides constant-time performance for basic operations (add, remove, contain, and size).',
    ));
    questionWidgets.add(_buildQuestion(
      context,
      35,
      'What is the HashSet class in Java and how does it store elements?',
      'The HashSet class implements the Set interface in the Java Collections Framework and is a member of the HashSet class. Unlike duplicate values, it stores a collection of distinct elements. In this implementation, each element is mapped to an index in an array using a hash function, and the index is used to quickly access the element. It produces an index for the element in the array where it is stored based on the input element. Assuming the hash function distributes the elements among the buckets appropriately, the HashSet class provides constant-time performance for basic operations (add, remove, contain, and size).',
    ));
    questionWidgets.add(_buildQuestion(
      context,
      36,
      'What is LinkedHashSet in Java Collections Framework?',
      'The LinkedHashSet is an ordered version of Hashset maintained by a doubly-linked List across all the elements. It is very helpful when iteration order is needed. During Iteration in LinkedHashSet, elements are returned in the same order they are inserted.',
    ));
    questionWidgets.add(_buildQuestion(
      context,
      37,
      'What is an enumeration?',
      'Enumeration is a user-defined data type. It is mainly used to assign names to integral constants, the names make a program easy to read and maintain. The main objective of the enum is to define user-defined data types.',
    ));
    questionWidgets.add(_buildQuestion(
      context,
      38,
      'How many types of exceptions can occur in a Java program?',
      'There are generally two types of exceptions in Java:\n•Built-in Exceptions: Built-in exceptions in Java are provided by the Java Libraries. These exceptions can be further divided into two subcategories i.e., checked and unchecked Exceptions. Below are some of the built-in exceptions in Java:\n\n• ArrayIndexOutOfBoundsExceptions\n• FileNotFoundException\n• ClassNotFoundException\n• NullPointerException\n• IOException\n• InterruptedException\n• ArithmeticException\n• InterruptedException\n• RuntimeException \n\n•User-Defined Exceptions: User-defined exceptions are defined by the programmers themselves to handle some specific situations or errors which are not covered by built-in exceptions. To define user-defined exceptions a new class that extends the appropriate exception class must be defined. User-defined Exceptions in Java are used when the built-in exceptions are in Java.',
    ));
    questionWidgets.add(_buildQuestion(
      context,
      39,
      'What do you mean by a Multithreaded program?',
      'Multithreaded programs in Java contain threads that run concurrently instead of running sequentially. A computer can use its resources more efficiently by combining multiple tasks at once. Any program with multithreading allows more than one user to simultaneously use the program without running multiple copies. A multithreaded program is designed to run multiple processes at the same time which can improve the performance of a program and allows the program to utilize multiple processors and improves the overall throughput.',
    ));
    questionWidgets.add(_buildQuestion(
      context,
      40,
      'What are the two ways in which Thread can be created?',
      'Multithreading is a Java feature that allows concurrent execution of two or more parts of a program for maximum utilization of the CPU. In general, threads are small, lightweight processes with separate paths of execution. These threads use shared memory, but they act independently, thus if any one thread fails it does not affect the other threads. There are two ways to create a thread:\n •By extending the Thread class \n •By implementing a Runnable interface.',
    ));
    questionWidgets.add(_buildQuestion(
      context,
      41,
      'What is a thread?',
      'Threads in Java are subprocess with lightweight with the smallest unit of processes and also has separate paths of execution. These threads use shared memory but they act independently hence if there is an exception in threads that do not affect the working of other threads despite them sharing the same memory. A thread has its own program counter, execution stack, and local variables, but it shares the same memory space with other threads in the same process. Java provides built-in support for multithreading through the Runnable interface and the Thread class.',
    ));
    questionWidgets.add(_buildQuestion(
      context,
      42,
      'What is a daemon thread?',
      'A daemon thread in Java is a low-priority thread that is used to perform background operations or tasks which are used to perform continuously. such as Garbage collection, Signal dispatches, Action listeners, etc. Daemon threads in Java have lower priority than user threads, which means they can only execute when no user threads are running. Daemon threads in Java are useful features that are required for background tasks that do not require explicit shutdown or finalization. It allows more efficient use of system resource and are used to simplify resources and can simplify long-running tasks.',
    ));
    questionWidgets.add(_buildQuestion(
      context,
      43,
      'Describe the life cycle of the thread?',
      '①New: The thread has been created but has not yet started.\n②Runnable: The thread is running, executing its task, or is ready to run if there are no other higher-priority threads. \n③Blocked: The thread is temporarily suspended, waiting for a resource or an event. \n④Waiting: The thread is waiting for another thread to perform a task or for a specified amount of time to elapse. \n⑤Terminated: The thread has completed its task or been terminated by another thread.',
    ));
    questionWidgets.add(_buildQuestion(
      context,
      44,
      'Why Garbage Collection is necessary in Java?',
      'For Java, Garbage collection is necessary to avoid memory leaks which can cause the program to crash and become unstable. There is no way to avoid garbage collection in Java. Unlike C++, Garbage collection in Java helps programmers to focus on the development of the application instead of managing memory resources and worrying about memory leakage. Java Virtual Machine (JVM) automatically manages the memory periodically by running a garbage collector which frees up the unused memory in the application. Garbage collection makes Java memory efficient because it removes unreferenced objects from the heap memory.',
    ));
    questionWidgets.add(_buildQuestion(
      context,
      45,
      'What is a memory leak, and how does it affect garbage collection?',
      'In Java Memory leaks can be caused by a variety of factors, such as not closing resources properly, holding onto object references longer than necessary, or creating too many objects unnecessarily. There are situations in which garbage collector does not collect objects because there is a reference to those objects. In these situations where the application creates lots of objects and does not use them and every object has some valid references, a Garbage collector in Java cannot destroy the objects. These useless objects which do not provide any value to the program are known as Memory leaks. Memory leaks can impact garbage collection negatively by preventing the garbage collector from reclaiming unused memory. This behavior will lead to slow performance or sometimes system failure. In a program, it is important to avoid memory leaks by managing resources and object references properly. ',
    ));
    questionWidgets.add(_buildQuestion(
      context,
      46,
      'What is JDBC?',
      'JDBC standard API is used to link Java applications and relational databases. It provides a collection of classes and interfaces that let programmers to use the Java programming language to communicate with the database. The classes and interface of JDBC allow the application to send requests which are made by users to the specified database. There are generally four components of JDBC by which it interacts with the database: \n• JDBC API\n• JDBC Driver manager \n• JDBC Test Suite \n• JDBC-ODBC Bridge Drivers',
    ));
    questionWidgets.add(_buildQuestion(
      context,
      47,
      'What are the steps to connect to the database in Java?',
      '\n• Import the Packages\n• Load the drivers using the forName() method \n• Register the drivers using DriverManager \n• Establish a connection using the Connection class object\n• Create a statement\n• Execute the query\n• Close the connections',
    ));
    questionWidgets.add(_buildQuestion(
      context,
      48,
      'What is the best way to inject dependency? Also, state the reason.',
      'There is no boundation for using a particular dependency injection. But the recommended approach is - \nSetters are mostly recommended for optional dependencies injection, and constructor arguments are recommended for mandatory ones.This is because constructor injection enables the injection of values into immutable fields and enables reading them more easily.',
    ));
    questionWidgets.add(_buildQuestion(
      context,
      49,
      'Is it possible to import the same class or package twice in Java and what happens to it during runtime?',
      'It is possible to import a class or package more than once, however, it is redundant because the JVM internally loads the package or class only once.',
    ));
    questionWidgets.add(_buildQuestion(
      context,
      50,
      'What could be the tradeoff between the usage of an unordered array versus the usage of an ordered array?',
      '• The main advantage of having an ordered array is the reduced search time complexity of O(log n) whereas the time complexity in an unordered array is O(n).\n• The main drawback of the ordered array is its increased insertion time which is O(n) due to the fact that its element has to reordered to maintain the order of array during every insertion whereas the time complexity in the unordered array is only O(1). \n• Considering the above 2 key points and depending on what kind of scenario a developer requires, the appropriate data structure can be used for implementation',
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
          ArrayPage(),
        ),
        buildProgramCard(
          context,
          'Applet',
          'assets/images/java/applet.png',
          Applet(),
        ),
        buildProgramCard(
          context,
          'Basic',
          'assets/images/java/helloworld.png',
          BasicPage(),
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
          'Miscellaneous',
          'assets/images/java/misc.png',
          Miscellaneous(),
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
          'Swing',
          'assets/images/java/swing.png',
          SwingPage(),
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
