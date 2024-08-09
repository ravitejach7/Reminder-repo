// ignore_for_file: prefer_typing_uninitialized_variables, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// ignore: implementation_imports, depend_on_referenced_packages
import 'package:timezone/src/date_time.dart';

void main() {
  runApp(MyApp());
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reminder App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ReminderPage(),
    );
  }
}

// ignore: use_key_in_widget_constructors
class ReminderPage extends StatefulWidget {
  @override
  _ReminderPageState createState() => _ReminderPageState();
}

class _ReminderPageState extends State<ReminderPage> {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
      
        get uiLocalNotificationDateInterpretation => null;

  @override
  void initState() {
    super.initState();

    var initializationSettingsAndroid =
        const AndroidInitializationSettings('@mipmap/ic_launcher');
    //var initializationSettingsIOS = IOSInitializationSettings();
    var initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      //iOS: initializationSettingsIOS,
    );
    flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future<void> _scheduleNotification(String activity, Time time) async {
    var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
      'channel_id',
      'channel_name',
      //'channel_description',
    );
    //var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      //iOS: iOSPlatformChannelSpecifics,
    );
    var mixin;
    mixin; TimeOfDay; {
}

    // ignore: await_only_futures
    await time;
  }

  Future<void> time(String activity, Time time, NotificationDetails platformChannelSpecifics) {
    return flutterLocalNotificationsPlugin.zonedSchedule(
    0,
    'Reminder',
    'Time for $activity',
    time as TZDateTime,
   //DateTime.now().add(const Duration(seconds: 5)),
    platformChannelSpecifics, uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
    androidAllowWhileIdle: true,  
  );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Reminder App')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            DropdownButton<String>(
              hint: const Text('Select Day'),
              items: [
                'Monday',
                'Tuesday',
                'Wednesday',
                'Thursday',
                'Friday',
                'Saturday',
                'Sunday'
              ].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (selectedDay) {
                // Handle day selection
              },
            ),
            const SizedBox(height: 20),
            DropdownButton<TimeOfDay>(
              hint: const Text('Select Time'),
              items: List.generate(24, (hour) {
                return DropdownMenuItem<TimeOfDay>(
                  value: TimeOfDay(hour: hour, minute: 0),
                  child: Text('$hour:00'),
                );
              }),
              onChanged: (selectedTime) {
                // Handle time selection
              },
            ),
            const SizedBox(height: 20),
            DropdownButton<String>(
              hint: const Text('Select Activity'),
              items: [
                'Wake up',
                'Go to gym',
                'Breakfast',
                'Meetings',
                'Lunch',
                'Quick nap',
                'Go to library',
                'Dinner',
                'Go to sleep',
              ].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (selectedActivity) async {
                // Handle activity selection
                // Get the selected day and time from their respective DropdownButtons
                // Call _scheduleNotification(selectedActivity, selectedTime);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Time {
}