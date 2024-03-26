
import 'dart:convert';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'notificationController.dart';

class PushData{
  static Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    Map<String, dynamic> data= message.data;
    String displayName = data["callerName"];
    String callId = data["call_id"];
      await AwesomeNotifications().createNotification(
          actionButtons: [
            NotificationActionButton(key: "yes", label: "Принять"),
            NotificationActionButton(key: "no", label: "Отклонить")
          ],
          content: NotificationContent(
            id: 10,
            channelKey: 'sound_channel',
            category: NotificationCategory.Call,
            title: '${displayName}',
              notificationLayout: NotificationLayout.Inbox,
              wakeUpScreen: true,
            fullScreenIntent: true,
            payload: {"call_id":callId},
            body: 'Вам поступил звонок',
            playState: NotificationPlayState.playing
          ),
      );
  }



  static Future<void> setIsolateForeground() async{
    // FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
    //   print(message.data);
    //   print(message.data);
    //     print('Got a message whilst in the foreground!');
    //     await AwesomeNotifications().createNotification(
    //         actionButtons: [
    //           NotificationActionButton(key: "yes", label: "Принять"),
    //           NotificationActionButton(key: "no", label: "Отклонить"),
    //         ],
    //         content: NotificationContent(
    //           id: 10,
    //           actionType: ActionType.Default,
    //           channelKey: 'sound_channel',
    //           payload: {"call_id": message.data["call_id"]},
    //           category: NotificationCategory.Call,
    //           notificationLayout: NotificationLayout.Inbox,
    //           title: '${message.data["callerName"]}',
    //           body: 'Вам поступил звонок',
    //         ),
    //     );
    //     print('Notification Title: ${message.notification?.title}');
    //     print('Notification Body: ${message.notification?.body}');
    //
    // });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      print(message.data);
      print('Got a message whilst in the foreground!');
      print(message.data);
      print('Got a message whilst in the foreground!');
      await AwesomeNotifications().createNotification(
          actionButtons: [
            NotificationActionButton(key: "yes", label: "Принять"),
            NotificationActionButton(key: "no", label: "Отклонить"),
          ],
          content: NotificationContent(
            id: 10,
            actionType: ActionType.Default,
            channelKey: 'sound_channel',
            notificationLayout: NotificationLayout.Inbox,

            payload: {"call_id": message.data["call_id"]},
            category: NotificationCategory.Call,
            title: '${message.data["callerName"]}',
            body: 'Вам поступил звонок',
          )
      );


    });

  }

  static Future<void> setIsolateBackground() async {

    FirebaseMessaging.onBackgroundMessage(PushData.firebaseMessagingBackgroundHandler);

    AwesomeNotifications().setListeners(
        onActionReceivedMethod: NotificationController.onActionReceivedMethod
    );

    var s = await AwesomeNotifications().checkPermissionList();
    AwesomeNotifications().requestPermissionToSendNotifications();
    print(s);
    await AwesomeNotifications().initialize(
        null,
        [
          NotificationChannel(
              channelGroupKey: 'basic_channel_group',
              channelKey: 'sound_channel',
              soundSource: "resource://raw/isound",
              channelName: 'Basic notifications',
              channelDescription: 'Notification channel for basic tests',
              defaultColor: Color(0xFF9D50DD),
              enableVibration: true,
              importance: NotificationImportance.High,
              ledColor: Colors.white
          )
        ],
        // Channel groups are only visual and are not required
        channelGroups: [
          NotificationChannelGroup(
              channelGroupKey: 'basic_channel_group',
              channelGroupName: 'Basic group'
          )
        ],
        debug: false
    );


  }


}

