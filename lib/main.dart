import 'package:federal_school/domain/states/main/mainState.dart';
import 'package:federal_school/presentation/themes/themes.dart';
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
  runApp( SchoolApp());
}


class SchoolApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return  Provider(
        create: (context) => MainState(),
        child: Observer(
            builder: (context){
              return MaterialApp(
                theme: lightTheme(),
                darkTheme: darkTheme(),
                themeMode: context.read<MainState>().isDarkMode ? ThemeMode.dark : ThemeMode.light,
                home: LoginView(),
              );
            }
        ),
    );
  }

}

