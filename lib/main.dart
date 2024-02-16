import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:federal_school/domain/states/login/loginViewModel.dart';
import 'package:federal_school/presentation/pages/home/homeView.dart';
import 'package:federal_school/presentation/pages/login/loginView.dart';
import 'package:federal_school/presentation/themes/themes.dart';
import 'package:federal_school/testView.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('ru_RU', null);
  await initializeDateFormatting();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await FirebaseAppCheck.instance.activate(
    // Set appleProvider to `AppleProvider.debug`
    androidProvider: AndroidProvider.playIntegrity
  );

  runApp(SchoolApp());
}


class SchoolApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      initTheme: lightTheme(),
      builder: (context, theme){
          return MaterialApp(
            home: TestView(),
            themeMode: ThemeMode.light,
            theme: theme,
            darkTheme: darkTheme(),
          );
      },

    );
  }

}

