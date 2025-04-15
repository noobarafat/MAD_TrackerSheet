import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkMode = false;

  void toggleDarkMode(bool value) {
    setState(() {
      isDarkMode = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Settings Example',
      debugShowCheckedModeBanner: false,
      theme: isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: SettingsScreen(
        isDarkMode: isDarkMode,
        onToggle: toggleDarkMode,
      ),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  final bool isDarkMode;
  final Function(bool) onToggle;

  const SettingsScreen({
    super.key,
    required this.isDarkMode,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        backgroundColor: Colors.deepPurple,
      ),
      body: ListView(
        children: [
          SwitchListTile(
            title: const Text("Dark Mode"),
            value: isDarkMode,
            activeColor: Colors.deepPurple,
            onChanged: onToggle,
          ),
        ],
      ),
    );
  }
}
