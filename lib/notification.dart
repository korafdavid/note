// ignore_for_file: unused_local_variable
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:notes/data/models.dart';
import 'package:notes/screens/edit.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
class Notificationhandler {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
       DateTime dateTimenow = DateTime.now();
        
        

  Future<void> scheduleNotification(
      DateTime dateTime, String title, String body) async {
      //var byteData = await rootBundle.load('assets/packages/2019a.t');
        //  tz.initializeDatabase(byteData.buffer.asUint8List());
   
   

  tz.initializeTimeZones();


    // var time = tz.TZDateTime.from(
    //   dateTime,
    //   tz.local
    //   //tz.getLocation('America/Detroit')
    // );

    var time = tz.TZDateTime.from(dateTime,tz.local);

    const AndroidNotificationDetails androidPlatformChannelSpecifics =  AndroidNotificationDetails(
      'channel id',
      'channel name',
      'channel description',
      icon: '@mipmap/ic_launcher',
      largeIcon: DrawableResourceAndroidBitmap('@mipmap/ic_launcher'),
    );
   const IOSNotificationDetails iOSPlatformChannelSpecifics =  IOSNotificationDetails();
    var platformChannelSpecifics = const NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics
    );

    await flutterLocalNotificationsPlugin.zonedSchedule(
      0,
      title,
      body,
      time,
      platformChannelSpecifics,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.wallClockTime,
      androidAllowWhileIdle: true,
    );

   
  }
}

 Future<void> onSelectNotification(String? payload) async {
    // ignore: unnecessary_null_comparison
    if (payload != null) {
      debugPrint('notification payload: ' + payload);
    }
  }

 oSelectNotification(String payload, BuildContext context, dynamic Function()? triggerRefetch, NotesModel? existingNote) {
  Navigator.of(context).push(MaterialPageRoute(builder: (_) {
    return EditNotePage(
 triggerRefetch: triggerRefetch,
 existingNote: existingNote
    );
  }));
  
}


datePicker(BuildContext _, String title, String body){
 return showDialog(context: _, builder: (_){
   return  Dialog(
    child: SizedBox(
              height: 400,
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.time,
                initialDateTime: DateTime.now(),
                onDateTimeChanged: (DateTime newDateTime)async {
                 await  Notificationhandler().scheduleNotification(newDateTime, title, body);
               
                },
                use24hFormat: false,
                minuteInterval: 1,
              ),
            ),
   );
 });
}

