import 'package:federal_school/features/onBoarding/View/onBoardingView.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp( SchoolApp());
}

class SchoolApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.white, // Your accent color
        ),
      ),
      home: OnBoardingView(),
    );
  }

}

