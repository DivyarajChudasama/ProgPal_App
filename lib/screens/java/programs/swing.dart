import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/github.dart';
import 'package:flutter_highlight/themes/googlecode.dart';
import 'package:flutter_highlight/themes/vs.dart';
import 'package:flutter_highlight/themes/vs2015.dart';

class SwingPage extends StatefulWidget {
  const SwingPage({super.key});

  @override
  State<SwingPage> createState() => _SwingPageState();
}

class _SwingPageState extends State<SwingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Swing'),
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
              title: Text('JMenuItem'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => JMenuItem()),
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
              title: Text('JList'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => JList()),
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
              title: Text('JComboBox'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => JComboBox()),
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
              title: Text('JColorChooser'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => JColorChooser()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class JMenuItem extends StatelessWidget {
  final String JMenuItemCode = '''
import java.awt.*;
import java.awt.event.*;
import javax.swing.*;

public class JMenuBarExample implements Runnable, ActionListener
{
    private JLabel message;
    private JFrame frame;
    private JMenuBar menuBar;
    private JMenu fileMenu;
    private JMenu editMenu;
    private JMenuItem openMenuItem;
    private JMenuItem cutMenuItem;
    private JMenuItem copyMenuItem;
    private JMenuItem pasteMenuItem;

    public static void main(String[] args)
    {
        SwingUtilities.invokeLater(new JMenuBarExample());
    }

    public void run()
    {
        frame = new JFrame("Java JMenubar Example");
        menuBar = new JMenuBar();
        message = new JLabel();

        message.setHorizontalAlignment(JLabel.CENTER);

        // build the File menu
        fileMenu = new JMenu("File");
        openMenuItem = new JMenuItem("Open");
        fileMenu.add(openMenuItem);

        // build the Edit menu
        editMenu = new JMenu("Edit");
        cutMenuItem = new JMenuItem("Cut");
        copyMenuItem = new JMenuItem("Copy");
        pasteMenuItem = new JMenuItem("Paste");
        editMenu.add(cutMenuItem);
        editMenu.add(copyMenuItem);
        editMenu.add(pasteMenuItem);

        //set listener
        openMenuItem.addActionListener(this);
        cutMenuItem.addActionListener(this);
        copyMenuItem.addActionListener(this);
        pasteMenuItem.addActionListener(this);

        // add menus to menubar
        menuBar.add(fileMenu);
        menuBar.add(editMenu);

        // put the menubar on the frame
        frame.setJMenuBar(menuBar);
        frame.add(message, BorderLayout.CENTER);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setPreferredSize(new Dimension(400, 300));
        frame.pack();
        frame.setLocationRelativeTo(null);
        frame.setVisible(true);
    }

    //handles the click event on JMenutem
    public void actionPerformed(ActionEvent ev)
    {
        String textOnMenu = ((JMenuItem) ev.getSource()).getText();
        message.setText(textOnMenu + " menu item clicked.");
    }
}
''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JMenuItem'),
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
                      JMenuItemCode,
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
                          Clipboard.setData(ClipboardData(text: JMenuItemCode));
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
              '1\n2\n3\n4\n5\n6\n7\n8\n9\n10\n11\n12\n13\n14\n15\n16\n17\n18\n19\n20\n21\n22\n23\n24\n25\n26\n27\n28\n29\n30\n31\n32\n33\n34\n35\n36\n37\n38\n39\n40\n41\n42\n43\n44\n45\n46\n47\n48\n49\n50\n51\n52\n53\n54\n55\n56\n57\n58\n59',
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

class JList extends StatelessWidget {
  final String JListCode = '''
import java.awt.*;
import java.awt.event.*;
import javax.swing.*;

class JListDemo extends JFrame
{
    // Instance attributes used in this example
    private JPanel topPanel;
    private JList listbox;

    // Constructor of main frame
    public JListDemo()
    {
        // Set the frame characteristics
        setTitle("JList Demo");
        setSize(300, 150);
        setBackground(Color.gray);

        // Create a panel to hold all other components
        topPanel = new JPanel();
        topPanel.setLayout(new BorderLayout());
        getContentPane().add(topPanel);

        // Create some items to add to the list
        String listData[] =
                {
                        "Java",
                        "Python",
                        "Polymer",
                        "PHP"
                };

        // Create a new listbox control
        listbox = new JList(listData);
        topPanel.add(listbox, BorderLayout.CENTER);
    }

    // Main entry point for this example
    public static void main(String args[])
    {
        // Create an instance of the test application
        JListDemo mainFrame = new JListDemo();
        mainFrame.setVisible(true);
        mainFrame.setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
    }
}
''';

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JList'),
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
                      JListCode,
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
                          Clipboard.setData(ClipboardData(text: JListCode));
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
              '1\n2\n3\n4\n5\n6\n7\n8\n9\n10\n11\n12\n13\n14\n15\n16\n17\n18\n19\n20\n21\n22\n23\n24\n25\n26\n27\n28\n29\n30\n31\n32\n33\n34\n35\n36\n37',
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

class JComboBox extends StatelessWidget {
  final String JComboBoxCode = '''
import java.awt.*;
import java.awt.event.*;
import javax.swing.*;
import java.util.*;

public class ComboBoxDemo extends JPanel
        implements ActionListener
{
    JLabel picture;

    public ComboBoxDemo()
    {
        super(new BorderLayout());

        ArrayList<String> listPet = new ArrayList<String>();
        listPet.add("Bird");
        listPet.add("Cat");
        listPet.add("Dog");
        listPet.add("Rabbit");
        listPet.add("Pig");

        //Create the combo box, select the item at index 4.
        //Indices start at 0, so 4 specifies the pig.
        JComboBox petList = new JComboBox(listPet.toArray());
        petList.setSelectedIndex(4);
        petList.addActionListener(this);

        //Set up the picture.
        picture = new JLabel();
        picture.setFont(picture.getFont().deriveFont(Font.ITALIC));
        picture.setHorizontalAlignment(JLabel.CENTER);
        updateLabel(listPet.get(petList.getSelectedIndex()));
        picture.setBorder(BorderFactory.createEmptyBorder(10, 0, 0, 0));

        //The preferred size is hard-coded to be the width of the
        //widest image and the height of the tallest image + the border.
        //A real program would compute this.
        picture.setPreferredSize(new Dimension(177, 122 + 10));

        //Lay out the demo.
        add(petList, BorderLayout.PAGE_START);
        add(picture, BorderLayout.PAGE_END);
        setBorder(BorderFactory.createEmptyBorder(20, 20, 20, 20));
    }

    /**
     * Listens to the combo box.
     */
    public void actionPerformed(ActionEvent e)
    {
        JComboBox cb = (JComboBox) e.getSource();
        String petName = (String) cb.getSelectedItem();
        updateLabel(petName);
    }

    protected void updateLabel(String name)
    {
        picture.setText(name);
    }

    /**
     * Create the GUI and show it.  For thread safety,
     * this method should be invoked from the
     * event-dispatching thread.
     */
    private static void createAndShowGUI()
    {
        //Create and set up the window.
        JFrame frame = new JFrame("ComboBoxDemo");
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

        //Create and set up the content pane.
        JComponent newContentPane = new ComboBoxDemo();
        newContentPane.setOpaque(true); //content panes must be opaque
        frame.setContentPane(newContentPane);

        //Display the window.
        frame.pack();
        frame.setVisible(true);
    }

    public static void main(String[] args)
    {
        //Schedule a job for the event-dispatching thread:
        //creating and showing this application's GUI.
        javax.swing.SwingUtilities.invokeLater(new Runnable()
        {
            public void run()
            {
                createAndShowGUI();
            }
        });
    }
}
''';

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JJComboBox'),
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
                      JComboBoxCode,
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
                          Clipboard.setData(ClipboardData(text: JComboBoxCode));
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
              '1\n2\n3\n4\n5\n6\n7\n8\n9\n10\n11\n12\n13\n14\n15\n16\n17\n18\n19\n20\n21\n22\n23\n24\n25\n26\n27\n28\n29\n30\n31\n32\n33\n34\n35\n36\n37\n38\n39\n40\n41\n42\n43\n44\n45\n46\n47\n48\n49\n50\n51\n52\n53\n54\n55\n56\n57\n58\n59\n60\n61\n62\n63\n64\n65\n66\n67\n68\n69\n70\n71\n72\n73\n74\n75\n76\n77\n78\n79\n80\n81\n82\n83\n84\n85\n86\n87\n88\n89\n90\n91\n92',
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

class JColorChooser extends StatelessWidget {
  final String JColorChooserCode = '''
import java.awt.event.*;
import java.awt.*;
import javax.swing.*;

public class JColorChooserDemo extends JFrame implements ActionListener
{
    JButton b;
    Container c;

    JColorChooserDemo()
    {
        c = getContentPane();
        c.setLayout(new FlowLayout());

        b = new JButton("Color Chooser");
        b.addActionListener(this);

        c.add(b);
    }

    public void actionPerformed(ActionEvent e)
    {
        Color initialcolor = Color.RED;
        Color color = JColorChooser.showDialog(this, "Select a color", initialcolor);
        c.setBackground(color);
    }

    public static void main(String[] args)
    {
        JColorChooserDemo jColorChooser = new JColorChooserDemo();
        jColorChooser.setSize(400, 400);
        jColorChooser.setVisible(true);
        jColorChooser.setDefaultCloseOperation(EXIT_ON_CLOSE);
    }
}
''';

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JColorChooser'),
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
                      JColorChooserCode,
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
                              ClipboardData(text: JColorChooserCode));
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
              '1\n2\n3\n4\n5\n6\n7\n8\n9\n10\n11\n12\n13\n14\n15\n16\n17\n18\n19\n20\n21\n22\n23\n24\n25\n26\n27\n28\n29\n30\n31\n32',
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
