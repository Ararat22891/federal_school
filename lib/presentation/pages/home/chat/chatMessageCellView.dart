
import 'package:federal_school/presentation/Colors.dart';
import 'package:flutter/material.dart';

import '../../../../domain/models/chat/chatCellModel.dart';


class ChatMesageCellView extends StatelessWidget {

  ChatCellModel chat;
  ChatMesageCellView({required this.chat});

  @override
  Widget build(BuildContext context) {
    var isLightTheme = Theme.of(context).brightness == Brightness.light;

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
                      Text(chat.name, style: Theme.of(context).textTheme.titleMedium),
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
                              color: isLightTheme ? MyColors.darkbluetext : MyColors.darkThemeFont,
                              shape: BoxShape.circle,
                            ),
                            child: Text(chat.newMessagesCount.toString(), style: TextStyle(
                                color: isLightTheme ? Colors.white : Colors.black,
                                fontSize: 14, fontWeight: FontWeight.bold
                            ),),
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
