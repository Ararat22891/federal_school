import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:federal_school/presentation/pages/home/homeView.dart';
import 'package:federal_school/presentation/themes/themes.dart';
import 'package:federal_school/testView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'presentation/pages/login/loginView.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(SchoolApp());
}


class SchoolApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      duration: Duration(milliseconds: 500),
      initTheme: lightTheme(),
      builder: (context, theme){
          return MaterialApp(
            home: HomeView(),
            themeMode: ThemeMode.light,
            theme: theme,
            darkTheme: darkTheme(),
          );
      },

    );
  }

}

