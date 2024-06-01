import 'package:federal_school/presentation/pages/login/loginView.dart';
import 'package:federal_school/presentation/widgets/DefaultButton.dart';
import 'package:federal_school/presentation/widgets/GradientContainer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class BlockedView extends StatelessWidget {
  const BlockedView({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientContainer(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/sad_man.png"),
                  Text(
                    'Ваш аккаунт заблокирован\nадминистрацией',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  SizedBox(height: 20),
                  DefaultButton(
                      onPressed: (){
                        FirebaseAuth.instance.signOut().then(
                                (value){
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(builder: (context){
                                        return LoginView();
                                      }),
                                          (route) => false
                                  );
                                }
                        );
                      },
                      text: "Выйти"
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }
}