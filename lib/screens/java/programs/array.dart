import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/github.dart';
import 'package:flutter_highlight/themes/googlecode.dart';
import 'package:flutter_highlight/themes/obsidian.dart';
import 'package:flutter_highlight/themes/rainbow.dart';
import 'package:flutter_highlight/themes/sunburst.dart';
import 'package:flutter_highlight/themes/tomorrow-night-blue.dart';
import 'package:flutter_highlight/themes/tomorrow-night-bright.dart';
import 'package:flutter_highlight/themes/tomorrow-night.dart';
import 'package:flutter_highlight/themes/vs.dart';
import 'package:flutter_highlight/themes/vs2015.dart';

class ArrayPage extends StatefulWidget {
  const ArrayPage({super.key});

  @override
  State<ArrayPage> createState() => _ArrayPageState();
}

class _ArrayPageState extends State<ArrayPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Array'),
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
              title: Text('Basic Array'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BasicArray()),
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
              title: Text('Sorting'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Sorting()),
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
              title: Text('Operations'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Operations()),
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
              title: Text('Sum And Average'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SumAndAverage()),
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
              title: Text('2 Dimensional Array'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DimensionalArray()),
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
              title: Text('Add Two Matrix'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddTwoMatrix()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class BasicArray extends StatelessWidget {
  final String basicArrayCode = '''
import java.util.*;

class ArrayBasic
{
    public static void main(String[] args)
    {
        int[] arr;
        int size, i;

        Scanner sc = new Scanner(System.in);
        System.out.println("Enter size of array");
        size = sc.nextInt();
        arr = new int[size];
        System.out.println("\\nEnter array elements");
        for (i = 0; i < size; i++)
        {
            arr[i] = sc.nextInt();
        }
        System.out.println("\\nElements in the Array are : ");
        for (i = 0; i < size; i++)
        {
            System.out.print(arr[i] + " ");
        }
    }
}
''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Basic Array'),
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
                      basicArrayCode,
                      language: 'java',
                      padding: EdgeInsets.all(12),
                      textStyle: TextStyle(
                        fontFamily: 'Courier New',
                        fontSize: 14.0,
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
                              ClipboardData(text: basicArrayCode));
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
              '1\n2\n3\n4\n5\n6\n7\n8\n9\n10\n11\n12\n13\n14\n15\n16\n17\n18\n19\n20\n21\n22\n23\n24\n25\n26\n27\n28\n29',
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

class Sorting extends StatelessWidget {
  final String SortingCode = '''
import java.util.*;

class ArraySortingDemo
{
    public static void main(String[] args)
    {
        Scanner in = new Scanner(System.in);
        System.out.print("Enter no. of elements to sort : ");
        int size = in.nextInt();
        // initializing unsorted int array
        int iArr[] = new int[size];
        System.out.println("Enter " + size + " integer(s) :");
        for (int i = 0; i < size; i++)
        {
            iArr[i] = in.nextInt();
        }
        // let us print all the elements available in list
        for (int number : iArr)
        {
            System.out.println("Number = " + number);
        }
        // sorting array
        Arrays.sort(iArr);

        // let us print all the elements available in list
        System.out.println("The sorted int array is:");
        for (int number : iArr)
        {
            System.out.println("Number = " + number);
        }
    }
}
''';

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sorting'),
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
                      SortingCode,
                      language: 'java',
                      padding: EdgeInsets.all(12),
                      textStyle: TextStyle(
                        fontFamily: 'Courier New',
                        fontSize: 14.0,
                      ),
                      theme: vsTheme,
                    ),
                    Positioned(
                      top: 8.0,
                      right: 8.0,
                      child: IconButton(
                        icon: Icon(Icons.copy),
                        onPressed: () {
                          Clipboard.setData(ClipboardData(text: SortingCode));
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
              '1\n2\n3\n4\n5\n6\n7\n8\n9\n10\n11\n12\n13\n14\n15\n16\n17\n18\n19\n20\n21\n22\n23\n24\n25\n26\n27\n28\n29\n30\n31\n32\n33\n34\n35\n36',
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

class Operations extends StatelessWidget {
  final String OperationsCode = '''
class ArrayOperations
{
    public static void main(String[] args)
    {
        double[] myList = {1.9, 2.9, 3.4, 3.5};

        // Print all the array elements
        for (int i = 0; i < myList.length; i++)
        {
            System.out.println(myList[i] + " ");
        }
        // Summing all elements
        double total = 0;
        for (int i = 0; i < myList.length; i++)
        {
            total += myList[i];
        }

        System.out.println("Total is " + total);

        // Finding the largest element
        double max = myList[0];
        for (int i = 1; i < myList.length; i++)
        {
            if (myList[i] > max)
                max = myList[i];
        }
        System.out.println("Max is " + max);
    }
}
''';

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Operations'),
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
                      OperationsCode,
                      language: 'java',
                      padding: EdgeInsets.all(12),
                      textStyle: TextStyle(
                        fontFamily: 'Courier New',
                        fontSize: 14.0,
                      ),
                      theme: vsTheme,
                    ),
                    Positioned(
                      top: 8.0,
                      right: 8.0,
                      child: IconButton(
                        icon: Icon(Icons.copy),
                        onPressed: () {
                          Clipboard.setData(ClipboardData(text: OperationsCode));
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
              '1\n2\n3\n4\n5\n6\n7\n8\n9\n10\n11\n12\n13\n14\n15\n16\n17\n18\n19\n20\n21\n22\n23\n24\n25\n26\n27\n28\n29\n30\n31\n32\n33\n34\n35\n36\n37\n38\n39\n40\n41\n42\n43\n44\n45',
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

class SumAndAverage extends StatelessWidget {
  final String SumAndAverageCode = '''
import java.io.*;

class ArrayAverage
{
    public static void main(String[] args)
    {
        //define an array
        int[] numbers = new int[]{10, 20, 15, 25, 16, 60, 100};
        int sum = 0;
        for (int i = 0; i < numbers.length; i++)
        {
            sum = sum + numbers[i];
        }
        double average = sum / numbers.length;
        System.out.println("Sum of array elements is : " + sum);
        System.out.println("Average value of array elements is : " + average);
    }
}  
''';

    Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sum and Average'),
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
                      SumAndAverageCode,
                      language: 'java',
                      padding: EdgeInsets.all(12),
                      textStyle: TextStyle(
                        fontFamily: 'Courier New',
                        fontSize: 14.0,
                      ),
                      theme: vsTheme,
                    ),
                    Positioned(
                      top: 8.0,
                      right: 8.0,
                      child: IconButton(
                        icon: Icon(Icons.copy),
                        onPressed: () {
                          Clipboard.setData(ClipboardData(text: SumAndAverageCode));
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
            '1\n2\n3\n4\n5\n6\n7\n8\n9\n10\n11\n12\n13\n14\n15\n16\n17\n18\n19\n20\n21\n22\n23\n24\n25\n26\n27\n28\n29\n30',
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

class DimensionalArray extends StatelessWidget {
  final String DimensionalArrayCode = '''
import java.util.*;

class TwoDArray
{
    public static void main(String[] args)
    {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Enter # of rows: ");
        int rows = scanner.nextInt();
        System.out.print("Enter # of cols: ");
        int cols = scanner.nextInt();

        int[][] a = new int[rows][cols];

        System.out.print("Enter " + rows + "x" + cols + "=" + (rows * cols) + " integers: ");
        for (int i = 0; i < rows; i++)
        {
            for (int j = 0; j < cols; j++)
            {
                a[i][j] = scanner.nextInt();
            }
        }

        System.out.println("Here are those " + (rows * cols) + " integers in a " + rows + "x" + cols + " 2d-array:");
        System.out.println(Arrays.deepToString(a));
    }
}
''';

 
    Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dimensional Array'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LineNumbers4(),
              const SizedBox(width: 16.0),
              Expanded(
                child: Stack(
                  children: [
                    HighlightView(
                      DimensionalArrayCode,
                      language: 'java',
                      padding: EdgeInsets.all(12),
                      textStyle: TextStyle(
                        fontFamily: 'Courier New',
                        fontSize: 14.0,
                      ),
                      theme: vsTheme,
                    ),
                    Positioned(
                      top: 8.0,
                      right: 8.0,
                      child: IconButton(
                        icon: Icon(Icons.copy),
                        onPressed: () {
                          Clipboard.setData(ClipboardData(text: DimensionalArrayCode));
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

class LineNumbers4 extends StatelessWidget {
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
              '1\n2\n3\n4\n5\n6\n7\n8\n9\n10\n11\n12\n13\n14\n15\n16\n17\n18\n19\n20\n21\n22\n23\n24\n25\n26\n27\n28\n29\n30\n31\n32\n33\n34\n35\n36\n37\n38\n39\n40\n41\n42\n43\n44\n45',
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

class AddTwoMatrix extends StatelessWidget {
  final String AddTwoMatrixCode = '''
//In call by reference, the original value is changed if we made changes in the called method.

import java.util.*;
class AddTwoMatrix
{
    int m, n;
    int first[][] = new int[m][n];
    int second[][] = new int[m][n];
    AddTwoMatrix(int[][] first, int[][] second, int m, int n)
    {
        this.first = first;
        this.second = second;
        this.m = m;
        this.n = n;
    }
    public static void main(String[] args)
    {
        int m, n, c, d;
        Scanner in = new Scanner(System.in);
        System.out.println("Enter the number of rows and columns of matrix");
        m = in.nextInt();
        n = in.nextInt();
        int first[][] = new int[m][n];
        int second[][] = new int[m][n];
        System.out.println("Enter the elements of first matrix");
        for (c = 0; c < m; c++)
        {
            for (d = 0; d < n; d++)
            {
                first[c][d] = in.nextInt();
            }
        }
        System.out.println("Enter the elements of second matrix");
        for (c = 0; c < m; c++)
        {
            for (d = 0; d < n; d++)
            {
                second[c][d] = in.nextInt();
            }
        }
        System.out.println("\nElements of First matrix is : ");
        for (c = 0; c < m; c++)
        {
            for (d = 0; d < n; d++)
            {
                System.out.print(first[c][d] + "\t");
            }
            System.out.println();
        }
        System.out.println("\nElements of Second matrix is : ");
        for (c = 0; c < m; c++)
        {
            for (d = 0; d < n; d++)
            {
                System.out.print(second[c][d] + "\t");
            }
            System.out.println();
        }
        AddTwoMatrix a = new AddTwoMatrix(first, second, m, n);
        //call by reference
        a.addmatrix(a); //Passing Object
    }
    //Function for Adding two matrix and storing in third matrix 
    public void addmatrix(AddTwoMatrix a)
    {
        int c, d;
        int sum[][] = new int[a.m][a.n];
        for (c = 0; c < a.m; c++)
        {
            for (d = 0; d < a.n; d++)
            {
                sum[c][d] = a.first[c][d] + a.second[c][d];
            }
        }
        System.out.println("\nSum of the two matrices is : ");
        for (c = 0; c < a.m; c++)
        {
            for (d = 0; d < a.n; d++)
            {
                System.out.print(sum[c][d] + "\t");
            }
            System.out.println();
        }
    }
}
''';

      Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Two Matrix'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LineNumbers5(),
              const SizedBox(width: 16.0),
              Expanded(
                child: Stack(
                  children: [
                    HighlightView(
                      AddTwoMatrixCode,
                      language: 'java',
                      padding: EdgeInsets.all(12),
                      textStyle: TextStyle(
                        fontFamily: 'Courier New',
                        fontSize: 14.0,
                      ),
                      theme: vsTheme,
                    ),
                    Positioned(
                      top: 8.0,
                      right: 8.0,
                      child: IconButton(
                        icon: Icon(Icons.copy),
                        onPressed: () {
                          Clipboard.setData(ClipboardData(text: AddTwoMatrixCode));
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


class LineNumbers5 extends StatelessWidget {
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
              '1\n2\n3\n4\n5\n6\n7\n8\n9\n10\n11\n12\n13\n14\n15\n16\n17\n18\n19\n20\n21\n22\n23\n24\n25\n26\n27\n28',
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
