import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:fluttertoast/fluttertoast.dart';

class BasicPage extends StatefulWidget {
  const BasicPage({Key? key}) : super(key: key);

  @override
  State<BasicPage> createState() => _BasicPageState();
}

class _BasicPageState extends State<BasicPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Basic Programs'),
      ),
      body: ListView(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey.shade300, // Border color
                  width: 1.0, // Border width
                ),
              ),
            ),
            child: ListTile(
              title: Text('Hello World'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HelloWorld()),
                );
              },
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey.shade300, // Border color
                  width: 1.0, // Border width
                ),
              ),
            ),
            child: ListTile(
              title: Text('If-Else'),
              onTap: () {
                // Add functionality to navigate to the If-Else program page
              },
            ),
          ),
        ],
      ),
    );
  }
}

class HelloWorld extends StatelessWidget {
  final String helloWorldCode = '''
class HelloWorld
{
    public static void main(String args[])
    {
        System.out.println("Hello World!!");
    }
}
''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello World'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LineNumbers(),
            const SizedBox(width: 16.0),
            Expanded(
              child: Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Text(
                      helloWorldCode,
                      style: TextStyle(
                        fontFamily: 'Courier New',
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 8.0,
                    right: 8.0,
                    child: IconButton(
                      icon: Icon(Icons.copy),
                      onPressed: () {
                        Clipboard.setData(ClipboardData(text: helloWorldCode));
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Code copied to clipboard')),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LineNumbers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8.0),
          bottomLeft: Radius.circular(8.0),
        ),
        border: Border.all(color: Colors.grey.shade300),
      ),
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            '1\n2\n3\n4\n5\n6\n7\n8\n9\n10',
            style: TextStyle(
              fontFamily: 'Courier New',
              fontSize: 14.0,
            ),
            textAlign: TextAlign.right,
          ),
        ],
      ),
    );
  }
}
