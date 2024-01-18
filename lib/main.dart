import 'package:federal_school/features/onBoarding/View/onBoardingView.dart';
import 'package:flutter/material.dart';

import 'features/login/View/loginView.dart';
import 'features/splashScreen/View/splashView.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp( SchoolApp());
}

class SchoolApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey[900],
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.white, // Your accent color
        ),
      ),
      home: LoginView(),
    );
  }

}

