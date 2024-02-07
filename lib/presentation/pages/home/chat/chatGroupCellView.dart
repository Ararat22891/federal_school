import 'package:federal_school/domain/models/chat/chatGroupCellModel.dart';
import 'package:flutter/material.dart';

import '../../../Colors.dart';

class ChatGroupCellView extends StatelessWidget {

  ChatGroupCellModel group;
  ChatGroupCellView({required this.group});

  @override
  Widget build(BuildContext context) {
    bool isLight = Theme.of(context).brightness == Brightness.light ? true : false;

    return Material(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 6,),
        color: isLight ? MyColors.white : MyColors.darkThemeContainer,
        child: Card(
          surfaceTintColor: isLight ? MyColors.white : MyColors.darkThemeSelected,
          elevation: 6,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)
          ),
            clipBehavior: Clip.hardEdge,
            child: InkWell(
            onTap: (){},
            child: Container(
              padding: EdgeInsets.all(12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    foregroundImage: Image.network(group.imageUrl).image,
                    backgroundImage: Image.asset("assets/bird.jpg").image,
                    radius: 30,
                  ),
                  Container(width: 12,),


                  Expanded(child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(group.groupName, style: TextStyle(color: isLight ? MyColors.darkbluetext :MyColors.darkThemeFont, fontSize: 16, fontWeight: FontWeight.bold), maxLines: 1, overflow: TextOverflow.ellipsis,),
                      Text(group.lastMessageWithSender, style: TextStyle(color: Colors.grey, fontSize: 12,), overflow: TextOverflow.ellipsis,),
                      Container(height: 4,),
                      Text("${group.participantCount} Участников", style: TextStyle(color:  isLight ? MyColors.darkbluetext :MyColors.darkThemeFont, fontSize: 12), overflow: TextOverflow.ellipsis,),
                    ],
                  ),
                  ),

                  Container(
                    margin: EdgeInsets.only(left: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(group.sentDateTime, style: TextStyle(color: Colors.grey, fontSize: 12,),),
                        Container(
                          padding: EdgeInsets.all(7),
                          decoration: BoxDecoration(
                            color: isLight ? MyColors.darkbluetext : MyColors.darkThemeFont,
                            shape: BoxShape.circle,
                          ),
                          child: Text(group.newMessageCount.toString(), style: TextStyle(color: isLight ? Colors.white : Colors.black, fontSize: 14, fontWeight: FontWeight.bold),),
                        )
                      ],

                    ),
                  )
                ],
              ),
            ),
          )
        ),
      ),
    );
  }
}
