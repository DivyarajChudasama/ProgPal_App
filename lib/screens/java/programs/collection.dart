import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/github.dart';
import 'package:flutter_highlight/themes/googlecode.dart';
import 'package:flutter_highlight/themes/vs.dart';
import 'package:flutter_highlight/themes/vs2015.dart';

class CollectionPage extends StatefulWidget {
  const CollectionPage({super.key});

  @override
  State<CollectionPage> createState() => _CollectionPageState();
}

class _CollectionPageState extends State<CollectionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Collection'),
        backgroundColor: Colors.indigo[400],
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
              title: Text('Basic ArrayList'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BasicArrayList()),
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
              title: Text('HashMap'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HashMap()),
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
              title: Text('HashSet'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HashSet()),
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
              title: Text('Priority Queue'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PriorityQueue()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class BasicArrayList extends StatelessWidget {
  final String BasicArrayListCode = '''
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;

 class ArrayListBasics
{
    public static void main(String[] args)
    {
        ArrayList<String> al = new ArrayList<String>();
        // adding object in arraylist  

        al.add("Java");
        al.add("Go");
        al.add("C++");
        al.add("php");
        al.add("python");
        al.add("css");

        al.add("html");

        // add at specific index
        al.add(1, "Android");
        System.out.print("ArrayList :" + al);
        System.out.println();
        // remove from arraylist
        al.remove("php");
        // Size of ArrayList
        System.out.print("Size of ArrayList after removing php :" + al.size());
        System.out.println();
        System.out.println("Is java is in list :" + al.contains("Java"));
        //get specific element
        System.out.print("I want " + al.get(0));
        System.out.println();
        // list to array
        Object[] a = al.toArray();
        System.out.print("Array :");
        for (Object object : a)
        {
            System.out.print(object + " ");
        }
        System.out.println();
        // change element
        al.set(6, "Javascript");
        System.out.print("ArrayList after replace:" + al);
        System.out.println();
        // sort list using Collections Class
        Collections.sort(al);
        System.out.print("ArrayList after sort :" + al);
        System.out.println();
        //Index
        System.out.println("Index of Android :" + al.indexOf("Android"));
        //clear whole list
        al.clear();
        System.out.print(al + " " + "Is list empty after clear :" + al.isEmpty());
    }
}
''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Basic ArrayList'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LineNumbers(),
              const SizedBox(width: 16.0),
              Expanded(
                child: Stack(
                  children: [
                    HighlightView(
                      BasicArrayListCode,
                      language: 'java',
                      padding: EdgeInsets.all(12),
                      textStyle: TextStyle(
                        fontFamily: 'Consolas',
                        fontSize: 13.0,
                      ),
                      theme: vsTheme,
                    ),
                    Positioned(
                      top: 8.0,
                      right: 8.0,
                      child: IconButton(
                        icon: Icon(Icons.copy),
                        onPressed: () {
                          Clipboard.setData(
                              ClipboardData(text: BasicArrayListCode));
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
      ),
    );
  }
}

class LineNumbers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
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
              '1\n2\n3\n4\n5\n6\n7\n8\n9\n10\n11\n12\n13\n14\n15\n16\n17\n18\n19\n20\n21\n22\n23\n24\n25\n26\n27\n28\n29\n30\n31\n32\n33\n34\n35\n36\n37\n38\n39\n40\n41\n42\n43\n44\n45\n46',
              style: TextStyle(
                fontFamily: 'Courier New',
                fontSize: 14.0,
              ),
              textAlign: TextAlign.right,
            ),
          ],
        ),
      ),
    );
  }
}

class HashMap extends StatelessWidget {
  final String HashMapCode = '''
import java.util.*;

import java.util.HashMap;

public class HashMapBasics
{
    public static void main(String[] args)
    {
        HashMap<Integer, String> hm = new HashMap<Integer, String>();

        hm.put(1, "android");
        hm.put(2, "java");
        hm.put(3, "php");
        hm.put(4, "c++");
        hm.put(5, "javascript");
        hm.put(6, "html");

        System.out.println(hm + " ");
        System.out.println();

        System.out.println("Value at 1 is android :" + hm.containsKey(1));
        System.out.println("Value at 1 :" + hm.get(1));
        System.out.println("java is present :" + hm.containsValue("java"));

        //remove 
        hm.remove(2);
        hm.remove(6, "html");
        System.out.println("Size after remove operation :" + hm.size());

        //replace
        hm.replace(5, "jquery");
        hm.replace(4, "c++", "scala");
        System.out.println("HashMap after replace " + hm);

        hm.clear();
        System.out.println(hm + " Is Map is empty " + hm.isEmpty());
    }
}
''';

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HashMap'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LineNumbers1(),
              const SizedBox(width: 16.0),
              Expanded(
                child: Stack(
                  children: [
                    HighlightView(
                      HashMapCode,
                      language: 'java',
                      padding: EdgeInsets.all(12),
                      textStyle: TextStyle(
                        fontFamily: 'Consolas',
                        fontSize: 13.0,
                      ),
                      theme: vsTheme,
                    ),
                    Positioned(
                      top: 8.0,
                      right: 8.0,
                      child: IconButton(
                        icon: Icon(Icons.copy),
                        onPressed: () {
                          Clipboard.setData(ClipboardData(text: HashMapCode));
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
      ),
    );
  }
}

class LineNumbers1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
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
              '1\n2\n3\n4\n5\n6\n7\n8\n9\n10\n11\n12\n13\n14\n15\n16\n17\n18\n19\n20\n21\n22\n23\n24\n25\n26\n27\n28\n29\n30\n31\n32\n33\n34',
              style: TextStyle(
                fontFamily: 'Courier New',
                fontSize: 14.0,
              ),
              textAlign: TextAlign.right,
            ),
          ],
        ),
      ),
    );
  }
}

class HashSet extends StatelessWidget {
  final String HashSetCode = '''
import java.util.HashSet;

 class HashSetBasic
{
    public static void main(String[] args)
    {
        HashSet<String> hs = new HashSet<String>();
        hs.add("Java");
        hs.add("Android");
        hs.add("Php");
        hs.add("Ajax");

        System.out.println(hs);

        hs.add("Python");
        System.out.println(hs);

        // Can't add duplicate
        System.out.println("Is Java added :" + hs.add("Java"));

        // remove from HashSet
        hs.remove("Php");

        // Size of HashSet
        System.out.print("Size of ArrayList after removing Php :" + hs.size());
        System.out.println();

        System.out.println("Is java is in list :" + hs.contains("Java"));

        // HashSet to array
        Object[] a = hs.toArray();

        System.out.print("Array :");
        for (Object object : a)
        {
            System.out.print(object + " ");
        }
        System.out.println();

        //clear whole HashSet
        hs.clear();
        System.out.print(hs + " " + "Is HashSet empty after clear :" + hs.isEmpty());

    }
}
''';

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HashSet'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LineNumbers2(),
              const SizedBox(width: 16.0),
              Expanded(
                child: Stack(
                  children: [
                    HighlightView(
                      HashSetCode,
                      language: 'java',
                      padding: EdgeInsets.all(12),
                      textStyle: TextStyle(
                        fontFamily: 'Consolas',
                        fontSize: 13.0,
                      ),
                      theme: vsTheme,
                    ),
                    Positioned(
                      top: 8.0,
                      right: 8.0,
                      child: IconButton(
                        icon: Icon(Icons.copy),
                        onPressed: () {
                          Clipboard.setData(ClipboardData(text: HashSetCode));
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
      ),
    );
  }
}

class LineNumbers2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
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
              '1\n2\n3\n4\n5\n6\n7\n8\n9\n10\n11\n12\n13\n14\n15\n16\n17\n18\n19\n20\n21\n22\n23\n24\n25\n26\n27\n28\n29\n30\n31\n32\n33\n34\n35\n36\n37\n38\n39\n40',
              style: TextStyle(
                fontFamily: 'Consolas',
                fontSize: 13.0,
              ),
              textAlign: TextAlign.right,
            ),
          ],
        ),
      ),
    );
  }
}

class PriorityQueue extends StatelessWidget {
  final String PriorityQueueCode = '''
import java.util.HashSet;

 class HashSetBasic
{
    public static void main(String[] args)
    {
        HashSet<String> hs = new HashSet<String>();
        hs.add("Java");
        hs.add("Android");
        hs.add("Php");
        hs.add("Ajax");

        System.out.println(hs);

        hs.add("Python");
        System.out.println(hs);

        // Can't add duplicate
        System.out.println("Is Java added :" + hs.add("Java"));

        // remove from HashSet
        hs.remove("Php");

        // Size of HashSet
        System.out.print("Size of ArrayList after removing Php :" + hs.size());
        System.out.println();

        System.out.println("Is java is in list :" + hs.contains("Java"));

        // HashSet to array
        Object[] a = hs.toArray();

        System.out.print("Array :");
        for (Object object : a)
        {
            System.out.print(object + " ");
        }
        System.out.println();

        //clear whole HashSet
        hs.clear();
        System.out.print(hs + " " + "Is HashSet empty after clear :" + hs.isEmpty());

    }
}
''';

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PriorityQueue'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LineNumbers3(),
              const SizedBox(width: 16.0),
              Expanded(
                child: Stack(
                  children: [
                    HighlightView(
                      PriorityQueueCode,
                      language: 'java',
                      padding: EdgeInsets.all(12),
                      textStyle: TextStyle(
                        fontFamily: 'Consolas',
                        fontSize: 13.0,
                      ),
                      theme: vsTheme,
                    ),
                    Positioned(
                      top: 8.0,
                      right: 8.0,
                      child: IconButton(
                        icon: Icon(Icons.copy),
                        onPressed: () {
                          Clipboard.setData(
                              ClipboardData(text: PriorityQueueCode));
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
      ),
    );
  }
}

class LineNumbers3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
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
              '1\n2\n3\n4\n5\n6\n7\n8\n9\n10\n11\n12\n13\n14\n15\n16\n17\n18\n19\n20\n21\n22\n23\n24\n25\n26\n27\n28\n29\n30\n31\n32\n33\n34\n35\n36\n37\n38\n39',
              style: TextStyle(
                fontFamily: 'Consolas',
                fontSize: 13.0,
              ),
              textAlign: TextAlign.right,
            ),
          ],
        ),
      ),
    );
  }
}
