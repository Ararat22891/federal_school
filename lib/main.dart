import 'dart:io';
import 'dart:math';
import 'package:agora_uikit/agora_uikit.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:federal_school/data/exceptionHandler.dart';
import 'package:federal_school/data/push/notificationController.dart';
import 'package:federal_school/data/push/pushData.dart';
import 'package:federal_school/domain/models/user/user.dart';
import 'package:federal_school/presentation/pages/blocked/blockedView.dart';
import 'package:federal_school/presentation/pages/home/homeView.dart';
import 'package:federal_school/presentation/pages/login/loginView.dart';
import 'package:federal_school/presentation/themes/themes.dart';
import 'package:federal_school/snackBar.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:googleapis/biglake/v1.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

User? _user;
UserData? _userData;


final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('ru_RU', null);
  await initializeDateFormatting();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseAppCheck.instance.activate(
      androidProvider: AndroidProvider.playIntegrity,
      appleProvider: AppleProvider.debug
  );

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  _user = FirebaseAuth.instance.currentUser;
  await   _user?.reload();

  if (_user != null){
    var snap = await FirebaseDatabase.instance.ref('users').child(_user!.uid).get();

    if(!snap.exists){


      await FirebaseAuth.instance.signOut();
      _user = null;
    }
    else{
      final data = Map<String, dynamic>.from(snap.value as Map);
      _userData = UserData.fromJson(data);
    }


  }


  runApp(SchoolApp());

  
}

Widget _redirect(UserData? user){
  if(user == null){
    return LoginView();
  }
  else if (user.isEnable){
    return HomeView();
  }
  else if (!user.isEnable){
    return BlockedView();
  }

  return Container();
}






class SchoolApp extends StatelessWidget{
  SchoolApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {




    return ThemeProvider(
      initTheme: lightTheme(),
      builder: (context, theme) {
        return MaterialApp(
          navigatorKey: navigatorKey,
          scaffoldMessengerKey: SnackbarGlobal.key,
          home: _redirect(_userData),
          themeMode: ThemeMode.light,
          theme: theme,
          darkTheme: darkTheme(),

        );
      },

    );
  }
}


class MacOsApp extends StatelessWidget{
  MacOsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
        return MaterialApp(
          navigatorKey: navigatorKey,
          home:  Center(
            child: FlutterLogo(),
          ),
    );
  }
}

String generateRandomString(int len) {
  var randomObj = Random();
  const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  return List.generate(len, (index) => _chars[randomObj.nextInt(_chars.length)]).join();
}




