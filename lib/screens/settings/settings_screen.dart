import 'package:flutter/material.dart';
import 'package:progpal/screens/settings/theme_manager.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late ThemeManager _themeManager;
  bool isDarkTheme = false;
  bool premiumStatus = false;

  @override
  void initState() {
    _themeManager = ThemeManager(); // Get the singleton instance
    super.initState();
  }

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
              value: _themeManager.themeMode == ThemeMode.dark,
              onChanged: (value) {
                setState(() {
                  isDarkTheme = value;
                  _themeManager.toggleTheme(isDarkTheme);
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
