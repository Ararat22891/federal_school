import 'package:flutter/material.dart';
import '../../../ViewAssets/OrLineView.dart';
import '../../../ViewAssets/SocialNetworkSignView.dart';
import '../../../textStyles/textStyles.dart';
import 'package:federal_school/ViewAssets/DefaultButton.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
              margin: EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(),
                  Text("Уважение\nМир\nСвобода\n", style: TextStyles.OnBoardingStyle,),
                  Spacer(),
                  Column(
                        children: [
                          Text("Федеральная Партийная  Школа — лучший способ интеграции в единственную в России демократическую партию!", style: TextStyles.LittleGrey,),
                          SizedBox(height: 40,),
                          SocialNetworkSignView(),
                          SizedBox(height: 20,),
                          OrLineView(),
                          SizedBox(height: 20,),


                          DefaultButton(
                            onPressed: () {  },
                            child: Text("Регистрация с почтой", style: TextStyle(color: Colors.black), textAlign: TextAlign.center,),
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Есть аккуант?", style: TextStyle(color: Colors.grey),),
                              TextButton(
                                  onPressed: (){},
                                  child: Text("Войти")
                              )
                            ],
                          )
                        ]
                  ),


                ],
              ),
            ),

        )
    );
  }
}
