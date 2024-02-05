

import 'package:federal_school/presentation/Colors.dart';
import 'package:federal_school/presentation/pages/home/homeView.dart';
import 'package:federal_school/textStyles/textStyles.dart';
import 'package:flutter/material.dart';

class LoadingDialog extends StatelessWidget {
  const LoadingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shadowColor: Colors.transparent,
      elevation: 0,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 24, horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset("assets/checkMark.png",
              scale: 2.5,
            ),

            Container(
              height: 20,
            ),
            Text("Успешный вход!", style: TextStyle(color: MyColors.darkbluetext, fontSize: 18, fontWeight: FontWeight.bold),),


            Container(
              height: 24,
            ),

            FilledButton(
              onPressed: (){
                Navigator.pushAndRemoveUntil(context,
                  MaterialPageRoute(builder: (context) => const HomeView()),
                        (Route<dynamic> route) => false
                );
              },
              child: Text("Продолжить", style: TextStyle(color: Colors.white, fontSize: 14),),
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(MyColors.darkbluetext)
              ),
            ),

          ],
        ),
      )
    );
  }
}

