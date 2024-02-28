import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:agora_uikit/agora_uikit.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:federal_school/data/push/notificationController.dart';
import 'package:federal_school/data/push/pushData.dart';
import 'package:federal_school/domain/models/user/user.dart';
import 'package:federal_school/domain/states/login/loginViewModel.dart';
import 'package:federal_school/presentation/pages/home/homeView.dart';
import 'package:federal_school/presentation/pages/login/loginView.dart';
import 'package:federal_school/presentation/themes/themes.dart';
import 'package:federal_school/testView.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

User? _user;


final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

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

  _user = FirebaseAuth.instance.currentUser;


  runApp(SchoolApp());
}




class SchoolApp extends StatelessWidget{
  SchoolApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      initTheme: lightTheme(),
      builder: (context, theme){
        return MaterialApp(
            navigatorKey: navigatorKey,
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
  var r = Random();
  const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  return List.generate(len, (index) => _chars[r.nextInt(_chars.length)]).join();
}




