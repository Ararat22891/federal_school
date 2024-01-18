import 'package:flutter/material.dart';

import '../../../textStyles/textStyles.dart';

class SpashView extends StatelessWidget {
  const SpashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[900],
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                foregroundImage: Image.asset("assets/logo.png").image,
                radius: 70,
              ),
              SizedBox(height: 5,),
              Text("Федеральная школа", style: TextStyles.SplashStyle,)
            ],
          ),
        )

    );
  }
}
