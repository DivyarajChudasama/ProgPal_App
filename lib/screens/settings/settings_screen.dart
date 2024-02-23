import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text('Settings',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
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
            onTap: () {
              // Navigate to premium status screen
            },
          ),
          ListTile(
            title: Text('Theme'),
            onTap: () {
              // Navigate to theme selection screen
            },
          ),
        ],
      ),
    );
  }
}
