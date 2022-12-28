import 'package:flutter/material.dart';
import 'notification_service.dart';

class NotificationHome extends StatefulWidget {
  const NotificationHome({required Key key}) : super(key: key);

  @override
  _LocalNotificationScreenState createState() =>
      _LocalNotificationScreenState();
}

class _LocalNotificationScreenState extends State<NotificationHome> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LocalNotificationScreen(payload: '',),    
    );
  }
}


class LocalNotificationScreen extends StatefulWidget {
  //
  final String payload;

  const LocalNotificationScreen({required this.payload});

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<LocalNotificationScreen> {
  @override
  void initState() {
    super.initState();
    notificationPlugin
        .setListenerForLowerVersions(onNotificationInLowerVersions);
    notificationPlugin.setOnNotificationClick(onNotificationClick);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification'),
        leading: IconButton(
            icon: Icon(Icons.arrow_back_sharp),
            onPressed: () {
            //
            }),
      ),
      body: Center(
        child: TextButton( 
          child: Text('Send Notification'),
          onPressed: () async {
           // await notificationPlugin.showNotification();z
          },
        ),
      ),
    );
  }

  onNotificationInLowerVersions(ReceivedNotification receivedNotification) {}

  onNotificationClick(String payload) {
    print('Payload $payload');
  }
}