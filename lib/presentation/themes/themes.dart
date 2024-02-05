
import 'package:flutter/material.dart';

import '../Colors.dart';

ThemeData lightTheme(){
  return ThemeData.light().copyWith(
      appBarTheme: AppBarTheme(
        centerTitle: false
      ),

      textTheme: TextTheme(
        titleMedium: TextStyle(color: MyColors.darkbluetext, fontSize: 18, fontWeight: FontWeight.bold),
        labelLarge:  TextStyle(color: MyColors.darkbluetext,)
  )
  );
}

ThemeData darkTheme(){
  return ThemeData.dark().copyWith(
    appBarTheme: AppBarTheme(
        centerTitle: false
    ),

    textTheme: TextTheme(
        titleMedium: TextStyle(color: MyColors.darkThemeFont, fontSize: 18, fontWeight: FontWeight.bold),
        labelLarge:  TextStyle(color: MyColors.darkThemeFont, )
    )
  );
}