import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
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
                            BasicArrayListCode,
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
                              Clipboard.setData(
                                  ClipboardData(text: BasicArrayListCode));
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content: Text('Code copied to clipboard')),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
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
              '1\n2\n3\n4\n5\n6\n7\n8\n9\n10\n11\n12\n13\n14\n15\n16\n17\n18\n19\n20\n21\n22\n23\n24\n25\n26\n27\n28\n29\n30\n31\n32\n33\n34\n35\n36\n37\n38\n39\n40\n41\n42\n43\n44\n45\n46\n47\n48\n49\n50\n51\n52\n53\n54\n55\n56\n55\n56\n56\n57\n58\n59\n60\n61\n62\n63\n64\n65\n66\n67\n68\n69\n70\n71\n72\n73\n74\n75\n76\n77\n78\n79\n80',
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sorting'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LineNumbers1(),
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
                            SortingCode,
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
                              Clipboard.setData(
                                  ClipboardData(text: SortingCode));
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content: Text('Code copied to clipboard')),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
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
              '1\n2\n3\n4\n5\n6\n7\n8\n9\n10\n11\n12\n13\n14\n15\n16\n17\n18\n19\n20\n21\n22\n23\n24\n25\n26\n27\n28\n29\n30\n31\n32\n33\n34\n35\n36\n37\n38\n39\n40\n41\n42\n43\n44\n45\n46\n47\n48\n49\n50',
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Operations'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LineNumbers2(),
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
                            OperationsCode,
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
                              Clipboard.setData(
                                  ClipboardData(text: OperationsCode));
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content: Text('Code copied to clipboard')),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sum And Average'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LineNumbers3(),
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
                      SumAndAverageCode,
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
                        Clipboard.setData(
                            ClipboardData(text: SumAndAverageCode));
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('2 Dimensional Array'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LineNumbers4(),
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
                            DimensionalArrayCode,
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
                              Clipboard.setData(
                                  ClipboardData(text: DimensionalArrayCode));
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content: Text('Code copied to clipboard')),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Two Matrix'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LineNumbers5(),
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
                            AddTwoMatrixCode,
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
                              Clipboard.setData(
                                  ClipboardData(text: AddTwoMatrixCode));
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content: Text('Code copied to clipboard')),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
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
