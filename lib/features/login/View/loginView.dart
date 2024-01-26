import 'package:federal_school/Colors.dart';
import 'package:federal_school/features/login/View/ModalCodeVerificationView/modalCodeVerificationView.dart';
import 'package:flutter/material.dart';

import '../../../ViewAssets/DefaultButton.dart';
import '../../../ViewAssets/OrLineView.dart';
import '../../../ViewAssets/SocialNetworkSignView.dart';
import '../../../ViewAssets/phoneField.dart';
import '../../../textStyles/textStyles.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
        gradient:  LinearGradient(
          colors: [
            MyColors.blue70,
            MyColors.beige
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            Spacer(),
            Image.asset("assets/onboarding.png", scale: 3.3,),
            Spacer(),
            SingleChildScrollView(
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16))
                  ),
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 30,),
                        Row(
                          children: [
                            Spacer(),
                            Text("Войти", style: TextStyles.headline2,),
                            Spacer()
                          ],
                        ),
                        SizedBox(height: 24,),
                        Text("Номер телефона", style: TextStyle(color: MyColors.darkbluetext, fontSize: 18, fontWeight: FontWeight.bold),),
                        PhoneField(),
                        SizedBox(height: 8,),
                        Text("Введите номер своего телефона здесь", style: TextStyles.subBody),
                        Visibility(
                          child:Text("*Пожалуйста, введите свой номер телефона", style: TextStyles.errorBody),
                          visible: false,
                        ),
                        SizedBox(height: 24,),
                        DefaultButton(
                            onPressed: (){
                              showModalBottomSheet<void>(
                                  context: context,
                                  isScrollControlled: true,
                                  builder: (context) => FractionallySizedBox(
                                    heightFactor: 0.8,
                                    child: ModalCodeVerificationView(),
                                  )
                              );
                            },
                            text: "Войти"
                        ),
                        SizedBox(height: 60,),

                      ],
                    ),
                  )
              ),
            )
          ],
        ),
      ),
    );
  }
}
