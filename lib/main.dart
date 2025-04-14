import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const AnimatedShapeApp());
}

class AnimatedShapeApp extends StatelessWidget {
  const AnimatedShapeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animated Container Demo',
      debugShowCheckedModeBanner: false,
      home: const AnimatedShapeScreen(),
    );
  }
}

class AnimatedShapeScreen extends StatefulWidget {
  const AnimatedShapeScreen({super.key});

  @override
  State<AnimatedShapeScreen> createState() => _AnimatedShapeScreenState();
}

class _AnimatedShapeScreenState extends State<AnimatedShapeScreen> {
  double _width = 150;
  double _height = 150;
  Color _color = Colors.blue;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(20);

  void _changeShape() {
    setState(() {
      final random = Random();
      _width = random.nextInt(200).toDouble() + 100;
      _height = random.nextInt(200).toDouble() + 100;
      _color = Color.fromRGBO(
        random.nextInt(256),
        random.nextInt(256),
        random.nextInt(256),
        1,
      );
      _borderRadius = BorderRadius.circular(random.nextInt(100).toDouble());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Container Example'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: AnimatedContainer(
          width: _width,
          height: _height,
          decoration: BoxDecoration(
            color: _color,
            borderRadius: _borderRadius,
          ),
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeInOut,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _changeShape,
        backgroundColor: Colors.deepPurple,
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}
