
import 'dart:convert';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:federal_school/data/notifications/sendNotification.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'notificationController.dart';

class PushData{
  static Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    Map<String, dynamic> data= message.data;
    switch(data["type"]){
      case("Звонок"):
        String displayName = data["callerName"];
        String callId = data["call_id"];
        await AwesomeNotifications().createNotification(
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
      case("Сообщение"):
        String message = data["message"];
        String sender = data["sender"];
        String chatUID = data["chatUID"];
        await AwesomeNotifications().createNotification(

          content: NotificationContent(
              id: 11,
              channelKey: 'chat_channel',
              title: '${sender}',
              category: NotificationCategory.Social,
              notificationLayout: NotificationLayout.Messaging,
              wakeUpScreen: true,
              fullScreenIntent: true,
              payload: {"chatUID":chatUID},
              body: '${message}',
              playState: NotificationPlayState.playing
          ),
        );
      case("Событие"):
        String displayName = data["callerName"];
        String callId = data["call_id"];
        await AwesomeNotifications().createNotification(

          content: NotificationContent(
              id: 10,
              channelKey: 'event_channel',
              title: '${displayName}',
              notificationLayout: NotificationLayout.Inbox,
              wakeUpScreen: true,
              fullScreenIntent: true,
              payload: {"call_id":callId},
              body: 'Вам поступил звонок',
              playState: NotificationPlayState.playing
          ),
        );
      case("Курс"):
        String displayName = data["callerName"];
        String callId = data["call_id"];
        await AwesomeNotifications().createNotification(

          content: NotificationContent(
              id: 10,
              channelKey: 'course_channel',
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


  }



  static void setIsolateForeground() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {


      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');

      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
      }
      Map<String, dynamic> data= message.data;
      switch(data["type"].toString()){
        case("Звонок"):
          String displayName = data["callerName"];
          String callId = data["call_id"];
          await AwesomeNotifications().createNotification(

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
        case("Сообщение"):
          String message = data["message"];
          String sender = data["sender"];
          String chatUID = data["chatUID"];
          await AwesomeNotifications().createNotification(

            content: NotificationContent(
                id: 10,
                channelKey: 'chat_channel',
                category: NotificationCategory.Email,
                title: '${sender}',
                notificationLayout: NotificationLayout.Inbox,
                wakeUpScreen: true,
                fullScreenIntent: true,
                payload: {"chatUID":chatUID},
                body: '${message}',
            ),
          );
        case("Событие"):
          String displayName = data["callerName"];
          String callId = data["call_id"];
          await AwesomeNotifications().createNotification(

            content: NotificationContent(
                id: 10,
                channelKey: 'event_channel',
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


    });

  }

  static Future<void> setIsolateBackground() async {

    FirebaseMessaging.onBackgroundMessage(PushData.firebaseMessagingBackgroundHandler);

    AwesomeNotifications().setListeners(
        onActionReceivedMethod: NotificationController.onActionReceivedMethod
    );

    await AwesomeNotifications().initialize(
        null,
        [
          NotificationChannel(
            channelGroupKey: 'basic_channel_group',
            channelKey: 'chat_channel',
            channelName: 'Чат',
            channelDescription: 'Канал уведомлений для сообщений чата',
            defaultColor: Color(0xFF9D50DD),
            enableVibration: true,
            channelShowBadge: true,
            ledColor: Colors.white,

          ),
          NotificationChannel(
              channelGroupKey: 'basic_channel_group',
              channelKey: 'sound_channel',
              channelName: 'Звонки',
              channelDescription: 'Канал уведомлений для видеозвонков',
              defaultColor: Color(0xFF9D50DD),
              enableVibration: true,
              channelShowBadge: true,
              ledColor: Colors.white,
              defaultRingtoneType: DefaultRingtoneType.Ringtone
          ),



          NotificationChannel(
            channelGroupKey: 'basic_channel_group',
            channelKey: 'event_channel',
            channelName: 'События',
            channelDescription: 'Канал уведомлений для новых событий',
            defaultColor: Color(0xFF9D50DD),
            enableVibration: true,
            channelShowBadge: true,
            ledColor: Colors.white,
          ),

          NotificationChannel(
            channelGroupKey: 'basic_channel_group',
            channelKey: 'course_channel',
            channelName: 'Курсы',
            channelDescription: 'Канал уведомлений для новых курсов',
            defaultColor: Color(0xFF9D50DD),
            enableVibration: true,
            channelShowBadge: true,

            ledColor: Colors.white,
          )
        ],
        // Channel groups are only visual and are not required
        channelGroups: [
          NotificationChannelGroup(
              channelGroupKey: 'basic_channel_group',
              channelGroupName: 'Уведомления'
          )
        ],
        debug: false
    );



  }


}

