
import 'package:flutter/material.dart';

class SnackbarGlobal {
  static GlobalKey<ScaffoldMessengerState> key =
  GlobalKey<ScaffoldMessengerState>();



  static void show(String message) {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: TextStyle(fontSize: 16, color: Colors.white) ,
      ),
      duration: Duration(seconds: 3), // Продолжительность отображения
      dismissDirection: DismissDirection.none,
      behavior: SnackBarBehavior.floating, // Поведение SnackBar
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10), // Закругленные углы SnackBar
      ),

    );



    key.currentState!
      ..hideCurrentSnackBar()

      ..showSnackBar(
          snackBar
      );
    
  }
}


