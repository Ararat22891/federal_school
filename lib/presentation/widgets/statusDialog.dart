import 'package:federal_school/domain/states/login/loginViewModel.dart';
import 'package:federal_school/presentation/Colors.dart';
import 'package:federal_school/presentation/pages/application/applicationView.dart';
import 'package:federal_school/presentation/pages/blocked/blockedView.dart';
import 'package:federal_school/presentation/pages/home/homeView.dart';
import 'package:federal_school/textStyles/textStyles.dart';
import 'package:flutter/material.dart';

class StatusDialog extends StatelessWidget {


  StatusDialog({required this.status, this.isEnabled, required this.isStudent});

  AuthStatus status;
  bool? isEnabled = false;
  bool isStudent = true;

  @override
  Widget build(BuildContext context) {
    switch (status) {
      case AuthStatus.validCode:
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
                  Text("Успешный вход!", style: TextStyle(
                      color: MyColors.darkbluetext,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),),


                  Container(
                    height: 24,
                  ),

                  FilledButton(
                    onPressed: () {
                      if(isEnabled! && !isStudent) {
                        Navigator.pushAndRemoveUntil(context,
                            MaterialPageRoute(builder: (context) => HomeView()),
                                (Route<dynamic> route) => false
                        );
                      }
                      else if (isEnabled! && isStudent){
                        Navigator.pushAndRemoveUntil(context,
                            MaterialPageRoute(builder: (context) => ApplicationView()),
                                (Route<dynamic> route) => false
                        );
                      }
                      else{
                        Navigator.pushAndRemoveUntil(context,
                            MaterialPageRoute(builder: (context) => BlockedView()),
                                (Route<dynamic> route) => false
                        );
                      }
                    },
                    child: Text("Продолжить",
                      style: TextStyle(color: Colors.white, fontSize: 14),),
                    style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                            MyColors.darkbluetext)
                    ),
                  )

                ],
              ),
            )
        );
      case AuthStatus.invalidCode:
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
                  Image.asset("assets/red_circle_error.png",
                    scale: 4,
                  ),

                  Container(
                    height: 20,
                  ),
                  Text("Ошибка авторизации!", style: TextStyle(
                      color: MyColors.darkbluetext,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),),

                  Container(
                    height: 24,
                  ),

                  FilledButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Повторить",
                      style: TextStyle(color: Colors.white, fontSize: 14),),
                    style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                            MyColors.darkbluetext)
                    ),
                  )

                ],
              ),
            )
        );
      case AuthStatus.loading:
        return Dialog(
            backgroundColor: Colors.white,
            shadowColor: Colors.transparent,
            elevation: 0,
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 24,),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularProgressIndicator(
                    color: MyColors.darkThemeFont,
                  ),

                  Container(
                    height: 20,
                  ),
                  Text("Загрузка", style: TextStyle(
                      color: MyColors.darkbluetext,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),),

                ],
              ),
            )
        );
      case AuthStatus.networkError:
      // TODO: Handle this case.
      case AuthStatus.wrongCode:
      // TODO: Handle this case.



      case AuthStatus.incorrectNumb:
        // TODO: Handle this case.
      case AuthStatus.error:
        // TODO: Handle this case.

      case AuthStatus.main:
        // TODO: Handle this case.
      return Container();

    }
  }

}

