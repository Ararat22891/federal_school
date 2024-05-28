import 'package:federal_school/domain/models/user/user.dart';
import 'package:federal_school/presentation/pages/home/dialog/dialogView.dart';
import 'package:federal_school/presentation/pages/home/homeView.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:federal_school/main.dart';
import 'package:federal_school/presentation/pages/call/callView.dart';
import 'package:federal_school/presentation/pages/home/call/courseViewAsset.dart';
import 'package:flutter/material.dart';

class NotificationController {

  /// Use this method to detect when a new notification or a schedule is created
  @pragma("vm:entry-point")
  static Future <void> onNotificationCreatedMethod(ReceivedNotification receivedNotification) async {
    // Your code goes here
  }

  /// Use this method to detect every time that a new notification is displayed
  @pragma("vm:entry-point")
  static Future <void> onNotificationDisplayedMethod(ReceivedNotification receivedNotification) async {
    // Your code goes here
  }

  /// Use this method to detect if the user dismissed a notification
  @pragma("vm:entry-point")
  static Future <void> onDismissActionReceivedMethod(ReceivedAction receivedAction) async {
    // Your code goes here
  }

  @pragma("vm:entry-point")
  static Future <void> onActionReceivedMethod(ReceivedAction receivedAction) async {
    if(receivedAction.payload!.containsKey("userData")){
      var data = UserData.fromJson(receivedAction.payload!["userData"] as Map<String, dynamic>);
      await navigatorKey.currentState!.push(
          MaterialPageRoute(builder: (context) => DialogView(data)));
    }
    else if(receivedAction.payload!.containsKey("call_id")){
    await [Permission.camera, Permission.microphone].request();

    await navigatorKey.currentState!.push(
      MaterialPageRoute(builder: (context) => CallingView(channelName: receivedAction.payload!["call_id"]!)));
    }
    else{
      await navigatorKey.currentState!.push(
          MaterialPageRoute(builder: (context) => HomeView()));
    }
  }
}