import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/github.dart';
import 'package:flutter_highlight/themes/googlecode.dart';
import 'package:flutter_highlight/themes/vs.dart';
import 'package:flutter_highlight/themes/vs2015.dart';

class Applet extends StatefulWidget {
  const Applet({super.key});

  @override
  State<Applet> createState() => _AppletState();
}

class _AppletState extends State<Applet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Applet'),
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
              title: Text('Calculator'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Calculator()),
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
              title: Text('Chess board'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Chessboard()),
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
              title: Text('Jradio Button'),
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
              title: Text('Calculate Factorial'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Calculatefactorial()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Calculator extends StatelessWidget {
  final String CalculatorCode = '''
import java.applet.*;
import java.awt.*;
import java.awt.event.*;

class Calc extends Applet implements ActionListener

{
    String cmd[] = {"+", "-", "*", "/", "=", "C"};

    int pv = 0;
    String op = "";

    Button b[] = new Button[16];

    TextField t1 = new TextField(10);

    public void init()
    {
        setLayout(new BorderLayout());
        add(t1, "North");
        t1.setText("0");
        Panel p = new Panel();
        p.setLayout(new GridLayout(4, 4));

        for (int i = 0; i < 16; i++)
        {
            if (i < 10)
                b[i] = new Button(String.valueOf(i));

            else
                b[i] = new Button(cmd[i % 10]);
                b[i].setFont(new Font("Arial", Font.BOLD, 25));
                p.add(b[i]);

                add(p, "Center");
                b[i].addActionListener(this);
        }
    }

    public void actionPerformed(ActionEvent ae)
    {
        int res = 0;
        String cap = ae.getActionCommand();
        int cv = Integer.parseInt(t1.getText());

        if (cap.equals("C"))
        {
            t1.setText("0");
            pv = 0;
            cv = 0;
            res = 0;
            op = "";
        }

        else if (cap.equals("="))
        {
            res = 0;
            if (op == "+")
                res = pv + cv;

            else if (op == "-")
                res = pv - cv;

            else if (op == "*")
                res = pv * cv;

            else if (op == "/")
                res = pv / cv;

            t1.setText(String.valueOf(res));

        }

        else if (cap.equals("+") || cap.equals("-") || cap.equals("*") || cap.equals("/"))
        {
            pv = cv;
            op = cap;
            t1.setText("0");
        }

        else

        {
            int v = cv * 10 + Integer.parseInt(cap);
            t1.setText(String.valueOf(v));
        }
    }
}

/*
<applet code="Calc.class" width=401 height=391>
</applet>
*/
''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
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
                      CalculatorCode,
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
                              ClipboardData(text: CalculatorCode));
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
              '1\n2\n3\n4\n5\n6\n7\n8\n9\n10\n11\n12\n13\n14\n15\n16\n17\n18\n19\n20\n21\n22\n23\n24\n25\n26\n27\n28\n29\n30\n31\n32\n33\n34\n35\n36\n37\n38\n39\n40\n41\n42\n43\n44\n45\n46\n47\n48\n49\n50\n51\n52\n53\n54\n55\n56\n57\n58\n59\n60\n61\n62\n63\n64\n65\n66\n67\n68\n69\n70\n71\n72\n73',
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

class Chessboard extends StatelessWidget {
  final String ChessboardCode = '''
import java.applet.*;
import java.awt.*;
import java.awt.event.*;

class Calc extends Applet implements ActionListener

{
    String cmd[] = {"+", "-", "*", "/", "=", "C"};

    int pv = 0;
    String op = "";

    Button b[] = new Button[16];

    TextField t1 = new TextField(10);

    public void init()
    {
        setLayout(new BorderLayout());
        add(t1, "North");
        t1.setText("0");
        Panel p = new Panel();
        p.setLayout(new GridLayout(4, 4));

        for (int i = 0; i < 16; i++)
        {
            if (i < 10)
                b[i] = new Button(String.valueOf(i));

            else
                b[i] = new Button(cmd[i % 10]);
                b[i].setFont(new Font("Arial", Font.BOLD, 25));
                p.add(b[i]);

                add(p, "Center");
                b[i].addActionListener(this);
        }
    }

    public void actionPerformed(ActionEvent ae)
    {
        int res = 0;
        String cap = ae.getActionCommand();
        int cv = Integer.parseInt(t1.getText());

        if (cap.equals("C"))
        {
            t1.setText("0");
            pv = 0;
            cv = 0;
            res = 0;
            op = "";
        }

        else if (cap.equals("="))
        {
            res = 0;
            if (op == "+")
                res = pv + cv;

            else if (op == "-")
                res = pv - cv;

            else if (op == "*")
                res = pv * cv;

            else if (op == "/")
                res = pv / cv;

            t1.setText(String.valueOf(res));

        }

        else if (cap.equals("+") || cap.equals("-") || cap.equals("*") || cap.equals("/"))
        {
            pv = cv;
            op = cap;
            t1.setText("0");
        }

        else

        {
            int v = cv * 10 + Integer.parseInt(cap);
            t1.setText(String.valueOf(v));
        }
    }
}

/*
<applet code="Calc.class" width=401 height=391>
</applet>
*/
''';

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chess board'),
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
                      ChessboardCode,
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
                              ClipboardData(text: ChessboardCode));
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
 import java.awt.*;
import javax.swing.*;

 public class JRadioButtonDemo extends JFrame 
{ 
    public JRadioButtonDemo() 
	{
        super("Swing JRadioButton Demo");
 
        JRadioButton option1 = new JRadioButton("Linux");
        JRadioButton option2 = new JRadioButton("Windows");
        JRadioButton option3 = new JRadioButton("Macintosh");
 
        ButtonGroup group = new ButtonGroup();
        group.add(option1);
        group.add(option2);
        group.add(option3);
 
        setLayout(new FlowLayout());
 
        add(option1);
        add(option2);
        add(option3);
 
        pack();
    }
 
    public static void main(String args[])
	{
        SwingUtilities.invokeLater(new Runnable() 
		{
            @Override
            public void run() 
			{
                new JRadioButtonDemo().setVisible(true);
            }
        });
    }
}
''';

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jradio Button'),
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
              '1\n2\n3\n4\n5\n6\n7\n8\n9\n10\n11\n12\n13\n14\n15\n16\n17\n18\n19\n20\n21\n22\n23\n24\n25\n26\n27\n28\n29\n30\n31\n32\n33\n34',
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

class Calculatefactorial extends StatelessWidget {
  final String CalculatefactorialCode = '''
import java.awt.*;
import java.awt.event.*;

class FactEvent extends java.applet.Applet implements ActionListener
{
    TextField t1, t2;
    int fact = 1, m;
    Button b1, b2, b3;
    String msg;
    Label l1, l2;
    FactEvent e;

    public void init()
    {
        e = this;
        t1 = new TextField(3);
        t2 = new TextField(10);
        b1 = new Button("FIND FACTORIAL");
        l1 = new Label("ENTER THE NUMBER");
        l2 = new Label("RESULT");
        add(l1);
        add(t1);
        add(l2);
        add(t2);
        add(b1);
        b1.addActionListener(this);
    }

    public void actionPerformed(ActionEvent ae)
    {
        String str = t1.getText();
        if (str != "")
        {
            int num = Integer.parseInt(str);
            for (int i = num; i > 0; i--)
            {
                fact = fact * i;
            }

            msg = "" + fact;
            t2.setText(msg);
            fact = 1;
        }
    }
}
/*<applet code=FactEvent width=400 height=400>
</applet>*/
''';

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculate factorial'),
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
                      CalculatefactorialCode,
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
                              ClipboardData(text: CalculatefactorialCode));
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
