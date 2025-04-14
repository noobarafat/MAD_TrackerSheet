import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() => runApp(DateTimePickerApp());

class DateTimePickerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Date & Time Picker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DateTimePickerScreen(),
    );
  }
}

class DateTimePickerScreen extends StatefulWidget {
  @override
  _DateTimePickerScreenState createState() => _DateTimePickerScreenState();
}

class _DateTimePickerScreenState extends State<DateTimePickerScreen> {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  String get formattedDate => selectedDate != null
      ? DateFormat.yMMMMd().format(selectedDate!)
      : 'No date selected';

  String get formattedTime => selectedTime != null
      ? selectedTime!.format(context)
      : 'No time selected';

  Future<void> _pickDate() async {
    final DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (date != null) {
      setState(() {
        selectedDate = date;
      });
    }
  }

  Future<void> _pickTime() async {
    final TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (time != null) {
      setState(() {
        selectedTime = time;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Date & Time Picker'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _pickDate,
              child: Text('Pick Date'),
            ),
            SizedBox(height: 10),
            Text(formattedDate, style: TextStyle(fontSize: 18)),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: _pickTime,
              child: Text('Pick Time'),
            ),
            SizedBox(height: 10),
            Text(formattedTime, style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
