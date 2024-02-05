import 'package:federal_school/Colors.dart';
import 'package:federal_school/features/onBoarding/View/onBoardingView.dart';
import 'package:federal_school/textStyles/textStyles.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'features/login/View/loginView.dart';
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
    return  MaterialApp(
      theme: ThemeData(
        colorSchemeSeed: Colors.white,
      ),
      home: LoginView(),
    );
  }

}

