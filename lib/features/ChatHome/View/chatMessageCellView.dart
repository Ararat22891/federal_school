
import 'package:federal_school/Colors.dart';
import 'package:flutter/material.dart';

class ChatMesageCellView extends StatelessWidget {
  const ChatMesageCellView({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: (){},
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              backgroundImage: Image.network("https://www.pravilamag.ru/upload/img_cache/6fe/6feaf4ed1dfd740709864815d3a79178_ce_1080x720x0x293_cropped_666x444.jpg").image,
              radius: 30,
            ),
            Container(width: 12,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Чмо Утеев", style: TextStyle(color: MyColors.darkbluetext, fontSize: 18, fontWeight: FontWeight.bold),),
                Text("Привет! Я Павел дуров настоящий", style: TextStyle(color: Colors.grey, fontSize: 12,),),
              ],
            ),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text("10:12", style: TextStyle(color: Colors.grey, fontSize: 12,),),
                Container(
                  padding: EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    color: MyColors.darkbluetext,
                    shape: BoxShape.circle,
                  ),
                  child: Text("2", style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),),
                )
              ],
            )
          ],
        )
    );
  }
}
