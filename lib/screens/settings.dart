import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String selectedTheme = 'Light'; // Default theme

  void _changeTheme(String theme) {
    setState(() {
      selectedTheme = theme;
    });
    // Additional logic for changing the app theme can be added here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Theme',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildThemeOption('Light'),
                _buildThemeOption('Dark'),
                _buildThemeOption('Sky'),
              ],
            ),
            SizedBox(height: 16),
            _buildSettingsOption('Logout'),
            _buildSettingsOption('Feedback'),
            _buildSettingsOption('Privacy Policy'),
            // Add more settings options as needed
          ],
        ),
      ),
    );
  }

  Widget _buildThemeOption(String theme) {
    return GestureDetector(
      onTap: () {
        _changeTheme(theme);
      },
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: selectedTheme == theme ? Colors.blue : Colors.grey,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          theme,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildSettingsOption(String option) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextButton(
        onPressed: () {
          // Implement logic for each settings option
          if (option == 'Logout') {
            // Add logout logic
          } else if (option == 'Feedback') {
            // Add feedback logic
          } else if (option == 'Privacy Policy') {
            // Add privacy policy logic
          }
        },
        child: Text(
          option,
          style: TextStyle(
            fontSize: 16,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: SettingsScreen(),
  ));
}
