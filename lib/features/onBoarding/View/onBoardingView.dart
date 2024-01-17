import 'package:flutter/material.dart';
import '../../../textStyles/textStyles.dart';
import 'package:federal_school/ViewAssets/DefaultButton.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[900],
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
                          Text("Федеральная  Школа — лучший способ интеграции в Мир", style: TextStyles.LittleGrey,),
                          Row(
                            children: [
                              Spacer(),
                              IconButton(
                                  icon: Image.asset("assets/g.png", width: 20,),
                                  onPressed: (){},
                                  style: ButtonStyle(
                                    shape: MaterialStateProperty.all<CircleBorder>(
                                        CircleBorder(
                                            side: BorderSide(color: Colors.grey)
                                        )
                                    ),
                                  )
                              ),
                              SizedBox(width: 8,),
                              IconButton(
                                  icon: Icon(Icons.apple, size: 25, color: Colors.white,),
                                  onPressed: (){},
                                  style: ButtonStyle(
                                    shape: MaterialStateProperty.all<CircleBorder>(
                                        CircleBorder(
                                            side: BorderSide(color: Colors.grey)
                                        )
                                    ),
                                  )
                              ),
                              Spacer(),
                            ],
                          ),
                          SizedBox(height: 20,),

                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(height: 1, color: Colors.grey, ),
                              Container(
                                  color: Colors.grey[900],
                                  padding: EdgeInsets.symmetric(horizontal: 8),
                                  child: Text("ИЛИ", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),)
                              ),
                            ],
                          ),

                          SizedBox(height: 20,),


                          DefaultButton(
                            onPressed: () {  },
                            child: Text("Регистрация с почтой", style: TextStyle(color: Colors.black), textAlign: TextAlign.center,),
                            backgroundColor: Colors.white,
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
