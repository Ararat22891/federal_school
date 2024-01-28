import 'package:federal_school/Colors.dart';
import 'package:federal_school/features/login/View/DialogVerificationView/dialogVerificationView.dart';
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
    double height = MediaQuery.of(context).size.height;
    print(height);
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
            Container(
              height: height/2.5,
              child: Image.asset("assets/onboarding.png",  ),
            ),
            Spacer(),
            Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16))
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 18, vertical: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Spacer(),
                            Text("Войти", style: TextStyles.headline2),
                            Spacer()
                          ],
                        ),
                        SizedBox(height: 16,),
                        Text("Номер телефона", style: TextStyles.myBodyMain),
                        PhoneField(),
                        Text("Введите номер своего телефона здесь", style: TextStyles.subBody),
                        Visibility(
                          child:Text("*Пожалуйста, введите свой номер телефона", style: TextStyles.errorBody),
                          visible: false,
                        ),
                        SizedBox(height: 24,),
                        DefaultButton(
                            onPressed: (){
                              // showModalBottomSheet<void>(
                              //     context: context,
                              //     isScrollControlled: true,
                              //     builder: (context) => FractionallySizedBox(
                              //       heightFactor: 0.8,
                              //       child: ModalCodeVerificationView(),
                              //     )
                              // );

                              showDialog(
                                  context: context,
                                  builder: (context){
                                    return DialogVerificationView();
                                  }
                              );
                            },
                            text: "Войти"
                        ),

                      ],
                    ),

              ),
            )
          ],
        ),
      ),
    );
  }
}
