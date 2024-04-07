import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:progpal/services/notifi_service.dart';

class NotificationConfigScreen extends StatefulWidget {
  @override
  _NotificationConfigScreenState createState() =>
      _NotificationConfigScreenState();
}

class _NotificationConfigScreenState extends State<NotificationConfigScreen> {
  late TimeOfDay selectedTime = TimeOfDay(hour: 10, minute: 0);
  late String quote = '';

  @override
  void initState() {
    super.initState();
    fetchQuote();
  }

  Future<void> fetchQuote() async {
    final response =
        await http.get(Uri.parse('https://zenquotes.io/api/random/'));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      setState(() {
        quote = data.isNotEmpty ? data[0]['q'] : '';
      });
    } else {
      throw Exception('Failed to load quote');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification Configuration'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Quote of the Day:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              quote,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _selectTime(context);
              },
              child: Text(
                'Select Time for Notification: ${selectedTime.format(context)}',
              ),
            ),
            ScheduleBtn(selectedTime: selectedTime, quote: quote),
          ],
        ),
      ),
    );
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (pickedTime != null && pickedTime != selectedTime) {
      setState(() {
        selectedTime = pickedTime;
      });
    }
  }
}

class ScheduleBtn extends StatelessWidget {
  const ScheduleBtn({
    Key? key,
    required this.selectedTime,
    required this.quote,
  }) : super(key: key);

  final TimeOfDay selectedTime;
  final String quote;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Text('Schedule notifications'),
      onPressed: () {
        final selectedDateTime = DateTime(
          DateTime.now().year,
          DateTime.now().month,
          DateTime.now().day,
          selectedTime.hour,
          selectedTime.minute,
        );
        NotificationService()
            .scheduleNotification(
          title: 'Daily Motivation',
          body: quote,
          selectedTime: selectedDateTime,
        )
            .then((_) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Notification scheduled successfully!'),
            ),
          );
        }).catchError((error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Failed to schedule notification: $error'),
              backgroundColor: Colors.red,
            ),
          );
        });
      },
    );
  }
}
