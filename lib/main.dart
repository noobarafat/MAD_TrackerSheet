import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Swipe List Demo',
      debugShowCheckedModeBanner: false,
      home: const SwipeListPage(),
    );
  }
}

class SwipeListPage extends StatefulWidget {
  const SwipeListPage({super.key});

  @override
  State<SwipeListPage> createState() => _SwipeListPageState();
}

class _SwipeListPageState extends State<SwipeListPage> {
  List<String> items = List.generate(10, (index) => 'Item ${index + 1}');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Swipe to Edit/Delete"),
        backgroundColor: Colors.teal,
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];

          return Dismissible(
            key: Key(item),
            background: swipeActionLeft(),
            secondaryBackground: swipeActionRight(),
            confirmDismiss: (direction) async {
              if (direction == DismissDirection.endToStart) {
                bool confirm = await _showConfirmationDialog(context, "Delete", item);
                if (confirm) {
                  setState(() {
                    items.removeAt(index);
                  });
                }
                return confirm;
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Edit tapped on $item")),
                );
                return false;
              }
            },
            child: ListTile(
              title: Text(item),
              subtitle: const Text("Swipe to see options"),
              leading: const Icon(Icons.label_outline),
            ),
          );
        },
      ),
    );
  }

  Widget swipeActionLeft() {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      color: Colors.blue,
      child: const Icon(Icons.edit, color: Colors.white, size: 30),
    );
  }

  Widget swipeActionRight() {
    return Container(
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      color: Colors.red,
      child: const Icon(Icons.delete, color: Colors.white, size: 30),
    );
  }

  Future<bool> _showConfirmationDialog(BuildContext context, String action, String item) async {
    return await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("$action Confirmation"),
        content: Text("Are you sure you want to $action \"$item\"?"),
        actions: [
          TextButton(onPressed: () => Navigator.of(context).pop(false), child: const Text("Cancel")),
          TextButton(onPressed: () => Navigator.of(context).pop(true), child: const Text("Yes")),
        ],
      ),
    );
  }
}
