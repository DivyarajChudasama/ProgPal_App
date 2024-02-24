import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool premiumStatus = false;
  bool isDarkTheme = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'Settings',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.indigo,
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Change Password'),
            onTap: () {
              // Navigate to password change screen
            },
          ),
          ListTile(
            title: Text('Premium Status'),
            trailing: premiumStatus
                ? Icon(Icons.check, color: Colors.green)
                : Icon(Icons.close, color: Colors.red),
            onTap: () {
              // Toggle premium status
              setState(() {
                premiumStatus = !premiumStatus;
              });
            },
          ),
          ListTile(
            title: Text('Theme'),
            trailing: Switch(
              value: isDarkTheme,
              onChanged: (value) {
                setState(() {
                  isDarkTheme = value;
                  // Set theme here based on isDarkTheme
                  // Example: if (isDarkTheme) { setDarkTheme(); } else { setLightTheme(); }
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
