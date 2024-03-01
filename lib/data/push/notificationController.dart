import 'package:permission_handler/permission_handler.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:federal_school/main.dart';
import 'package:federal_school/presentation/pages/call/callView.dart';
import 'package:federal_school/presentation/pages/home/call/callViewAsset.dart';
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

  /// Use this method to detect when the user taps on a notification or action button
  @pragma("vm:entry-point")
  static Future <void> onActionReceivedMethod(ReceivedAction receivedAction) async {
    // Your code goes here
    await [Permission.camera, Permission.microphone].request();
    await navigatorKey.currentState!.push(
        MaterialPageRoute(builder: (context) => CallingView(channelName: receivedAction.payload!["call_id"]!)));
    // Navigate into pages, avoiding to open the notification details page over another details page already opened

  }
}