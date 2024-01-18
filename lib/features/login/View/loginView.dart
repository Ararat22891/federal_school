import 'package:flutter/material.dart';

import '../../../ViewAssets/OrLineView.dart';
import '../../../ViewAssets/SocialNetworkSignView.dart';
import '../../../textStyles/textStyles.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
             child: Container(
               margin: EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      foregroundImage: Image.asset("assets/logo.png").image,
                      radius: 40,
                    ),
                    SizedBox(height: 16,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Войти в ", style: TextStyles.bodyStyle,),
                        Text("Федеральную Школу", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),),
                      ],
                    ),
                    Text("\n\nДобро пожаловать снова! Войдите в свой аккаунт, используя социальный сети или почту, чтобы продолжить\n",
                      style: TextStyles.LittleGrey, textAlign: TextAlign.center,
                    ),
                    SocialNetworkSignView(),
                    SizedBox(height: 20,),
                    OrLineView(),
                  ],
                ),
             )
      ),
    );
  }
}
