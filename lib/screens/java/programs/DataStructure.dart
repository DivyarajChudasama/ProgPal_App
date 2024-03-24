import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/github.dart';
import 'package:flutter_highlight/themes/googlecode.dart';
import 'package:flutter_highlight/themes/vs.dart';
import 'package:flutter_highlight/themes/vs2015.dart';

class DataStructure extends StatefulWidget {
  const DataStructure({super.key});

  @override
  State<DataStructure> createState() => _DataStructureState();
}

class _DataStructureState extends State<DataStructure> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Structures'),
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
              title: Text('Stack'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Stacks()),
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
              title: Text('Java Queue Linked List Implementation'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Queues()),
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
              title: Text('Priority Queue using the Binary Max Heap'),
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
              title: Text('Binary Tree'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BinaryTree()),
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
              title: Text('Binary Search tree'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BinarySearchTree()),
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
              title: Text('AVL Tree'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AVLTree()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Stacks extends StatelessWidget {
  final String stackCode = '''
// Java code for stack implementation

import java.io.*;
import java.util.*;

class Test
{ 
	// Pushing element on the top of the stack
	static void stack_push(Stack<Integer> stack)
	{
		for(int i = 0; i < 5; i++)
		{
			stack.push(i);
		}
	}
	
	// Popping element from the top of the stack
	static void stack_pop(Stack<Integer> stack)
	{
		System.out.println("Pop Operation:");

		for(int i = 0; i < 5; i++)
		{
			Integer y = (Integer) stack.pop();
			System.out.println(y);
		}
	}

	// Displaying element on the top of the stack
	static void stack_peek(Stack<Integer> stack)
	{
		Integer element = (Integer) stack.peek();
		System.out.println("Element on stack top: " + element);
	}
	
	// Searching element in the stack
	static void stack_search(Stack<Integer> stack, int element)
	{
		Integer pos = (Integer) stack.search(element);

		if(pos == -1)
			System.out.println("Element not found");
		else
			System.out.println("Element is found at position: " + pos);
	}


	public static void main (String[] args)
	{
		Stack<Integer> stack = new Stack<Integer>();

		stack_push(stack);
		stack_pop(stack);
		stack_push(stack);
		stack_peek(stack);
		stack_search(stack, 2);
		stack_search(stack, 6);
	}
}

''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stack'),
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
                      stackCode,
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
                          Clipboard.setData(ClipboardData(text: stackCode));
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
              '1\n2\n3\n4\n5\n6\n7\n8\n9\n10\n11\n12\n13\n14\n15\n16\n17\n18\n19\n20\n21\n22\n23\n24\n25\n26\n27\n28\n29\n30\n31\n31\n32\n33\n34\n35\n36\n37\n38\n39\n40\n41\n42\n43\n44\n45\n46\n47\n48\n49',
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

class Queues extends StatelessWidget {
  final String QueuesCode = '''
class LinkedListQueue  
{  
 private Node front, rear;  
 private int queueSize; // queue size  
    
 //linked list node  
 private class Node {  
 int data;  
 Node next;  
 }  
 //default constructor - initially front & rear are null; size=0; queue is empty  
 public LinkedListQueue()  
 {  
 front = null;  
 rear = null;  
 queueSize = 0;  
 }  
//check if the queue is empty  
 public boolean isEmpty()  
 {  
 return (queueSize == 0);  
 }    
 //Remove item from the front of the queue.  
 public int dequeue()  
 {  
 int data = front.data;  
 front = front.next;  
 if (isEmpty())  
 {  
 rear = null;  
 }  
 queueSize--;  
 System.out.println("Element " + data+ " removed from the queue");  
 return data;  
 }  
 //Add data at the rear of the queue.  
 public void enqueue(int data)  
 {  
 Node oldRear = rear;  
 rear = new Node();  
 rear.data = data;  
 rear.next = null;  
 if (isEmpty())  
 {  
 front = rear;  
 }  
 else  {  
 oldRear.next = rear;  
 }  
 queueSize++;  
 System.out.println("Element " + data+ " added to the queue");  
 }  
 //print front and rear of the queue  
 public void print_frontRear() {  
     System.out.println("Front of the queue:" + front.data  
     + " Rear of the queue:" + rear.data);  
 }  
}  
class QueueLLImplementation{  
 public static void main(String a[]){  
 LinkedListQueue queue = new LinkedListQueue();  
 queue.enqueue(6);  
 queue.enqueue(3);  
 queue.print_frontRear();  
 queue.enqueue(12);  
 queue.enqueue(24);  
 queue.dequeue();  
 queue.dequeue();  
 queue.enqueue(9);   
 queue.print_frontRear();  
 }  
}  
''';

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Java Queue Linked List Implementation'),
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
                      QueuesCode,
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
                          Clipboard.setData(ClipboardData(text: QueuesCode));
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
              '1\n2\n3\n4\n5\n6\n7\n8\n9\n10\n11\n12\n13\n14\n15\n16\n17\n18\n19\n20\n21\n22\n23\n24\n25\n26\n27\n28\n29\n30\n31\n31\n32\n33\n34\n35\n36\n37\n38\n39\n40\n41\n42\n43\n44\n45\n46\n47\n48\n49\n50\n51\n52\n53\n54\n55\n56\n57',
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
#include <stdio.h>  
#include <stdio.h>  
int heap[40];  
int size=-1;  
  
// retrieving the parent node of the child node  
int parent(int i)   
{   
    
    return (i - 1) / 2;   
}   
  
// retrieving the left child of the parent node.  
int left_child(int i)  
{  
 return i+1;   
}  
// retrieving the right child of the parent  
int right_child(int i)  
{  
 return i+2;   
}  
// Returning the element having the highest priority  
int get_Max()  
{  
    return heap[0];  
}  
//Returning the element having the minimum priority  
int get_Min()  
{  
    return heap[size];  
}  
// function to move the node up the tree in order to restore the heap property.  
void moveUp(int i)   
{   
    while (i > 0)   
    {  
        // swapping parent node with a child node  
        if(heap[parent(i)] < heap[i]) {   
    
        int temp;  
        temp=heap[parent(i)];  
        heap[parent(i)]=heap[i];  
        heap[i]=temp;  
          
          
    }   
       // updating the value of i to i/2   
       i=i/2;  
    }  
}   
  
//function to move the node down the tree in order to restore the heap property.  
void moveDown(int k)  
{  
    int index = k;   
    
    // getting the location of the Left Child   
    int left = left_child(k);   
    
    if (left <= size && heap[left] > heap[index]) {   
        index = left;   
    }   
    
    // getting the location of the Right Child   
    int right = right_child(k);   
    
    if (right <= size && heap[right] > heap[index]) {   
        index = right;   
    }   
    
    // If k is not equal to index   
    if (k != index) {   
      int temp;  
      temp=heap[index];  
      heap[index]=heap[k];  
      heap[k]=temp;  
        moveDown(index);   
    }   
}  
  
// Removing the element of maximum priority  
void removeMax()  
{  
    int r= heap[0];  
    heap[0]=heap[size];  
    size=size-1;  
    moveDown(0);  
}  
//inserting the element in a priority queue  
void insert(int p)   
{   
    size = size + 1;   
    heap[size] = p;   
    
    // move Up to maintain heap property   
    moveUp(size);   
}   
  
//Removing the element from the priority queue at a given index i.  
void delete(int i)   
{   
    heap[i] = heap[0] + 1;   
    
   // move the node stored at ith location is shifted to the root node  
    moveUp(i);   
    
    // Removing the node having maximum priority   
    removeMax();   
}   
int main()  
{  
    // Inserting the elements in a priority queue  
  
    insert(20);  
    insert(19);  
    insert(21);  
    insert(18);  
    insert(12);  
    insert(17);  
    insert(15);  
    insert(16);  
    insert(14);  
    int i=0;  
  
 printf("Elements in a priority queue are : ");  
 for(int i=0;i<=size;i++)  
    {  
       printf("%d ",heap[i]);  
    }  
    delete(2); // deleting the element whose index is 2.  
    printf("\nElements in a priority queue after deleting the element are : ");  
    for(int i=0;i<=size;i++)  
    {  
       printf("%d ",heap[i]);  
    }  
int max=get_Max();  
    printf("\nThe element which is having the highest priority is %d: ",max);  
     
  
    int min=get_Min();  
        printf("\nThe element which is having the minimum priority is : %d",min);  
    return 0;  
}  
''';

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Priority Queue '),
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
                              ClipboardData(text: OperationsCode));
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
              '1\n2\n3\n4\n5\n6\n7\n8\n9\n10\n11\n12\n13\n14\n15\n16\n17\n18\n19\n20\n21\n22\n23\n24\n25\n26\n27\n28\n29\n30\n31\n31\n32\n33\n34\n35\n36\n37\n38\n39\n40\n41\n42\n43\n44\n45\n46\n47\n48\n49\n50\n51\n52\n53\n54\n55\n56\n57\n58\n59\n60\n61\n62\n63\n64\n65\n66\n67\n68\n69\n70\n71\n72\n73\n74\n75\n76\n77\n78\n79\n80\n81\n82\n83\n84\n85\n86\n87\n88\n89\n90\n91\n92\n93\n94\n95\n96\n97\n98\n99\n100\n101\n102\n103\n104\n105\n106\n107\n108\n109\n110\n111\n112\n113\n114\n115\n116\n117\n118',
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

class BinaryTree extends StatelessWidget {
  final String BinaryTreeCode = '''
  // Binary Tree in Java

// Node creation
class Node {
  int key;
  Node left, right;

  public Node(int item) {
  key = item;
  left = right = null;
  }
}

class BinaryTree {
  Node root;

  BinaryTree(int key) {
  root = new Node(key);
  }

  BinaryTree() {
  root = null;
  }

  // Traverse Inorder
  public void traverseInOrder(Node node) {
  if (node != null) {
    traverseInOrder(node.left);
    System.out.print(" " + node.key);
    traverseInOrder(node.right);
  }
  }

  // Traverse Postorder
  public void traversePostOrder(Node node) {
  if (node != null) {
    traversePostOrder(node.left);
    traversePostOrder(node.right);
    System.out.print(" " + node.key);
  }
  }

  // Traverse Preorder
  public void traversePreOrder(Node node) {
  if (node != null) {
    System.out.print(" " + node.key);
    traversePreOrder(node.left);
    traversePreOrder(node.right);
  }
  }

  public static void main(String[] args) {
  BinaryTree tree = new BinaryTree();

  tree.root = new Node(1);
  tree.root.left = new Node(2);
  tree.root.right = new Node(3);
  tree.root.left.left = new Node(4);

  System.out.print("Pre order Traversal: ");
  tree.traversePreOrder(tree.root);
  System.out.print("\nIn order Traversal: ");
  tree.traverseInOrder(tree.root);
  System.out.print("\nPost order Traversal: ");
  tree.traversePostOrder(tree.root);
  }
}
''';

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Binary Tree'),
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
                      BinaryTreeCode,
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
                              ClipboardData(text: BinaryTreeCode));
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
              '1\n2\n3\n4\n5\n6\n7\n8\n9\n10\n11\n12\n13\n14\n15\n16\n17\n18\n19\n20\n21\n22\n23\n24\n25\n26\n27\n28\n29\n30\n31\n31\n32\n33\n34\n35\n36\n37\n38\n39\n40\n41\n42\n43\n44\n45\n46\n47\n48\n49\n50\n51\n52\n53\n54',
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

class BinarySearchTree extends StatelessWidget {
  final String BinarySearchTreeCode = '''
// Binary Search Tree operations in Java

class BinarySearchTree {
  class Node {
    int key;
    Node left, right;

    public Node(int item) {
      key = item;
      left = right = null;
    }
  }

  Node root;

  BinarySearchTree() {
    root = null;
  }

  void insert(int key) {
    root = insertKey(root, key);
  }

  // Insert key in the tree
  Node insertKey(Node root, int key) {
    // Return a new node if the tree is empty
    if (root == null) {
      root = new Node(key);
      return root;
    }

    // Traverse to the right place and insert the node
    if (key < root.key)
      root.left = insertKey(root.left, key);
    else if (key > root.key)
      root.right = insertKey(root.right, key);

    return root;
  }

  void inorder() {
    inorderRec(root);
  }

  // Inorder Traversal
  void inorderRec(Node root) {
    if (root != null) {
      inorderRec(root.left);
      System.out.print(root.key + " -> ");
      inorderRec(root.right);
    }
  }

  void deleteKey(int key) {
    root = deleteRec(root, key);
  }

  Node deleteRec(Node root, int key) {
    // Return if the tree is empty
    if (root == null)
      return root;

    // Find the node to be deleted
    if (key < root.key)
      root.left = deleteRec(root.left, key);
    else if (key > root.key)
      root.right = deleteRec(root.right, key);
    else {
      // If the node is with only one child or no child
      if (root.left == null)
        return root.right;
      else if (root.right == null)
        return root.left;

      // If the node has two children
      // Place the inorder successor in position of the node to be deleted
      root.key = minValue(root.right);

      // Delete the inorder successor
      root.right = deleteRec(root.right, root.key);
    }

    return root;
  }

  // Find the inorder successor
  int minValue(Node root) {
    int minv = root.key;
    while (root.left != null) {
      minv = root.left.key;
      root = root.left;
    }
    return minv;
  }

  // Driver Program to test above functions
  public static void main(String[] args) {
    BinarySearchTree tree = new BinarySearchTree();

    tree.insert(8);
    tree.insert(3);
    tree.insert(1);
    tree.insert(6);
    tree.insert(7);
    tree.insert(10);
    tree.insert(14);
    tree.insert(4);

    System.out.print("Inorder traversal: ");
    tree.inorder();

    System.out.println("\n\nAfter deleting 10");
    tree.deleteKey(10);
    System.out.print("Inorder traversal: ");
    tree.inorder();
  }
}
''';

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Binary Search Tree'),
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
                      BinarySearchTreeCode,
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
                              ClipboardData(text: BinarySearchTreeCode));
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
              '1\n2\n3\n4\n5\n6\n7\n8\n9\n10\n11\n12\n13\n14\n15\n16\n17\n18\n19\n20\n21\n22\n23\n24\n25\n26\n27\n28\n29\n30\n31\n31\n32\n33\n34\n35\n36\n37\n38\n39\n40\n41\n42\n43\n44\n45\n46\n47\n48\n49\n50\n51\n52\n53\n54\n55\n56\n57\n58\n59\n60\n61\n62\n63\n64\n65\n66\n67\n68\n69\n70\n71\n72\n73\n74\n75\n76\n77\n78\n79\n80\n81\n82\n83\n84\n85\n86\n87\n88\n89\n90\n91\n92\n93\n94\n95\n96',
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

class AVLTree extends StatelessWidget {
  final String AVLTreeCode = '''
// Create node
class Node {
  int item, height;
  Node left, right;

  Node(int d) {
    item = d;
    height = 1;
  }
}

// Tree class
class AVLTree {
  Node root;

  int height(Node N) {
    if (N == null)
      return 0;
    return N.height;
  }

  int max(int a, int b) {
    return (a > b) ? a : b;
  }

  Node rightRotate(Node y) {
    Node x = y.left;
    Node T2 = x.right;
    x.right = y;
    y.left = T2;
    y.height = max(height(y.left), height(y.right)) + 1;
    x.height = max(height(x.left), height(x.right)) + 1;
    return x;
  }

  Node leftRotate(Node x) {
    Node y = x.right;
    Node T2 = y.left;
    y.left = x;
    x.right = T2;
    x.height = max(height(x.left), height(x.right)) + 1;
    y.height = max(height(y.left), height(y.right)) + 1;
    return y;
  }

  // Get balance factor of a node
  int getBalanceFactor(Node N) {
    if (N == null)
      return 0;
    return height(N.left) - height(N.right);
  }

  // Insert a node
  Node insertNode(Node node, int item) {

    // Find the position and insert the node
    if (node == null)
      return (new Node(item));
    if (item < node.item)
      node.left = insertNode(node.left, item);
    else if (item > node.item)
      node.right = insertNode(node.right, item);
    else
      return node;

    // Update the balance factor of each node
    // And, balance the tree
    node.height = 1 + max(height(node.left), height(node.right));
    int balanceFactor = getBalanceFactor(node);
    if (balanceFactor > 1) {
      if (item < node.left.item) {
        return rightRotate(node);
      } else if (item > node.left.item) {
        node.left = leftRotate(node.left);
        return rightRotate(node);
      }
    }
    if (balanceFactor < -1) {
      if (item > node.right.item) {
        return leftRotate(node);
      } else if (item < node.right.item) {
        node.right = rightRotate(node.right);
        return leftRotate(node);
      }
    }
    return node;
  }

  Node nodeWithMimumValue(Node node) {
    Node current = node;
    while (current.left != null)
      current = current.left;
    return current;
  }

  // Delete a node
  Node deleteNode(Node root, int item) {

    // Find the node to be deleted and remove it
    if (root == null)
      return root;
    if (item < root.item)
      root.left = deleteNode(root.left, item);
    else if (item > root.item)
      root.right = deleteNode(root.right, item);
    else {
      if ((root.left == null) || (root.right == null)) {
        Node temp = null;
        if (temp == root.left)
          temp = root.right;
        else
          temp = root.left;
        if (temp == null) {
          temp = root;
          root = null;
        } else
          root = temp;
      } else {
        Node temp = nodeWithMimumValue(root.right);
        root.item = temp.item;
        root.right = deleteNode(root.right, temp.item);
      }
    }
    if (root == null)
      return root;

    // Update the balance factor of each node and balance the tree
    root.height = max(height(root.left), height(root.right)) + 1;
    int balanceFactor = getBalanceFactor(root);
    if (balanceFactor > 1) {
      if (getBalanceFactor(root.left) >= 0) {
        return rightRotate(root);
      } else {
        root.left = leftRotate(root.left);
        return rightRotate(root);
      }
    }
    if (balanceFactor < -1) {
      if (getBalanceFactor(root.right) <= 0) {
        return leftRotate(root);
      } else {
        root.right = rightRotate(root.right);
        return leftRotate(root);
      }
    }
    return root;
  }

  void preOrder(Node node) {
    if (node != null) {
      System.out.print(node.item + " ");
      preOrder(node.left);
      preOrder(node.right);
    }
  }

  // Print the tree
  private void printTree(Node currPtr, String indent, boolean last) {
    if (currPtr != null) {
      System.out.print(indent);
      if (last) {
        System.out.print("R----");
        indent += "   ";
      } else {
        System.out.print("L----");
        indent += "|  ";
      }
      System.out.println(currPtr.item);
      printTree(currPtr.left, indent, false);
      printTree(currPtr.right, indent, true);
    }
  }

  // Driver code
  public static void main(String[] args) {
    AVLTree tree = new AVLTree();
    tree.root = tree.insertNode(tree.root, 33);
    tree.root = tree.insertNode(tree.root, 13);
    tree.root = tree.insertNode(tree.root, 53);
    tree.root = tree.insertNode(tree.root, 9);
    tree.root = tree.insertNode(tree.root, 21);
    tree.root = tree.insertNode(tree.root, 61);
    tree.root = tree.insertNode(tree.root, 8);
    tree.root = tree.insertNode(tree.root, 11);
    tree.printTree(tree.root, "", true);
    tree.root = tree.deleteNode(tree.root, 13);
    System.out.println("After Deletion: ");
    tree.printTree(tree.root, "", true);
  }
}

''';

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AVL Tree'),
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
                      AVLTreeCode,
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
                          Clipboard.setData(ClipboardData(text: AVLTreeCode));
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
              '1\n2\n3\n4\n5\n6\n7\n8\n9\n10\n11\n12\n13\n14\n15\n16\n17\n18\n19\n20\n21\n22\n23\n24\n25\n26\n27\n28\n29\n30\n31\n31\n32\n33\n34\n35\n36\n37\n38\n39\n40\n41\n42\n43\n44\n45\n46\n47\n48\n49\n50\n51\n52\n53\n54\n55\n56\n57\n58\n59\n60\n61\n62\n63\n64\n65\n66\n67\n68\n69\n70\n71\n72\n73\n74\n75\n76\n77\n78\n79\n80\n81\n82\n83\n84\n85\n86\n87\n88\n89\n90\n91\n92\n93\n94\n95\n96\n97\n98\n99\n100\n101\n102\n103\n104\n105\n106\n107\n108\n109\n110\n111\n112\n113\n114\n115\n116\n117\n118\n119\n120\n120\n121\n122\n123\n124\n125\n126\n127\n128\n129\n130\n131\n132\n133\n134\n135\n136\n137\n138\n139\n140\n141\n142\n143\n144\n145\n146\n147\n148\n149\n150\n151\n152\n153\n154\n155\n156\n157',
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
