import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Text Styles"),
        backgroundColor: const Color.fromARGB(255, 184, 222, 241),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Normal Text",
              style: TextStyle(fontSize: 25),
            ),
            const SizedBox(height: 10),
            Text(
              "Bold Text",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              "Italic Text",
              style: TextStyle(fontSize: 25, fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 10),
            Text(
              "Underlined Text",
              style: TextStyle(
                fontSize: 25,
                decoration: TextDecoration.underline,
                decorationColor: Colors.black,
                decorationThickness: 2,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Colored Text",
              style: TextStyle(fontSize: 25, color: Colors.purple),
            ),
            const SizedBox(height: 10),
            Text(
              "Shadowed Text",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                    color: Colors.black,
                    blurRadius: 5,
                    offset: Offset(2, 2),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Custom Font Style",
              style: TextStyle(
                fontSize: 25,
                fontFamily: 'Roboto',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
