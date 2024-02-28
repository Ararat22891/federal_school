import 'dart:math';
import 'package:agora_uikit/agora_uikit.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:federal_school/data/push/notificationController.dart';
import 'package:federal_school/data/push/pushData.dart';
import 'package:federal_school/presentation/pages/home/homeView.dart';
import 'package:federal_school/presentation/pages/login/loginView.dart';
import 'package:federal_school/presentation/themes/themes.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

User? _user;



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('ru_RU', null);
  await initializeDateFormatting();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseAppCheck.instance.activate(
      androidProvider: AndroidProvider.playIntegrity
  );
  FirebaseMessaging.onBackgroundMessage(PushData.firebaseMessagingBackgroundHandler);


 await AwesomeNotifications().initialize(
      null,
      [
        NotificationChannel(
            channelGroupKey: 'basic_channel_group',
            channelKey: 'sound_channel',
            soundSource: "resource://raw/isound",
            channelName: 'Basic notifications',
            playSound: true,
            channelDescription: 'Notification channel for basic tests',
            defaultColor: Color(0xFF9D50DD),
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

  FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
    print(message.data);
    print('Got a message whilst in the foreground!');
    print(message.data);
    if (message.notification != null) {

     await AwesomeNotifications().createNotification(
       actionButtons: [
         NotificationActionButton(key: "key", label: "Принять"),
         NotificationActionButton(key: "key", label: "Отклонить")
       ],
          content: NotificationContent(
            id: 10,

            actionType: ActionType.Default,
            channelKey: 'sound_channel',
            category: NotificationCategory.Call,
            title: 'Hello World!',
            body: 'This is my first notification!',
          )
      );
      print('Notification Title: ${message.notification?.title}');
      print('Notification Body: ${message.notification?.body}');
      runApp(SchoolApp());
    }
  });
  _user = FirebaseAuth.instance.currentUser;


  AwesomeNotifications().setListeners(
      onActionReceivedMethod: NotificationController.onActionReceivedMethod
  );
  runApp(SchoolApp());
}




class SchoolApp extends StatelessWidget{




  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      initTheme: lightTheme(),
      builder: (context, theme){
        Permission.notification.request();
        return MaterialApp(
            home: _user == null ? LoginView() : HomeView(),
            themeMode: ThemeMode.light,
            theme: theme,
            darkTheme: darkTheme(),
          );
      },

    );
  }

}

String generateRandomString(int len) {
  var randomObj = Random();
  const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  return List.generate(len, (index) => _chars[randomObj.nextInt(_chars.length)]).join();
}




