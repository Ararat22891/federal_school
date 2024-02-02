
import 'package:federal_school/Colors.dart';
import 'package:flutter/material.dart';

import '../Model/chatCellModel.dart';

class ChatMesageCellView extends StatelessWidget {

  ChatCellModel chat;
  ChatMesageCellView({required this.chat});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 6),
        child: InkWell(
            onTap: (){},
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 14),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    foregroundImage: Image.network(chat.imageUrl).image,
                    backgroundImage: Image.asset("assets/bird.jpg").image,
                    radius: 30,
                  ),
                  Container(width: 12,),


                  Expanded(child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(chat.name, style: TextStyle(color: MyColors.darkbluetext, fontSize: 18, fontWeight: FontWeight.bold),),
                      Text(chat.lastMessage, style: TextStyle(color: Colors.grey, fontSize: 12,), overflow: TextOverflow.ellipsis,),
                    ],
                  ),),
                  Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(chat.sentTime, style: TextStyle(color: Colors.grey, fontSize: 12,),),
                          Container(
                            padding: EdgeInsets.all(7),
                            decoration: BoxDecoration(
                              color: MyColors.darkbluetext,
                              shape: BoxShape.circle,
                            ),
                            child: Text(chat.newMessagesCount.toString(), style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),),
                          )
                        ],

                  )
                ],
              ),
            )
        ),
      )
    );
  }
}
