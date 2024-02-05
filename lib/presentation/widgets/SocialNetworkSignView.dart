
import 'package:flutter/material.dart';

class SocialNetworkSignView extends StatelessWidget {
  const SocialNetworkSignView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
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
    );
  }
}
