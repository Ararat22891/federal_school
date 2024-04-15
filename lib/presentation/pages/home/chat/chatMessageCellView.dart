
import 'package:federal_school/domain/models/user/user.dart';
import 'package:federal_school/presentation/Colors.dart';
import 'package:federal_school/presentation/pages/home/dialog/dialogView.dart';
import 'package:federal_school/presentation/widgets/MyCircleAvatar.dart';
import 'package:federal_school/presentation/widgets/verifiedNameViewAsset.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../domain/models/chat/chatCellModel.dart';


class ChatMesageCellView extends StatefulWidget {

  ChatCellModel chat;
  ChatMesageCellView({required this.chat});

  @override
  State<ChatMesageCellView> createState() => _ChatMesageCellViewState();
}

class _ChatMesageCellViewState extends State<ChatMesageCellView> {

  late MenuController _menuController;

  @override
  void initState() {
    _menuController = MenuController();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    var isLightTheme = Theme.of(context).brightness == Brightness.light;

    String fullName = widget.chat.otherUser.name == null ? "Неизвестный пользовательsdasaddasdsads": "${widget.chat.otherUser.surname} ${widget.chat.otherUser.name}";
    String date = formatMessageDate(widget.chat.sentTime);
    int newMessageCount = widget.chat!.newMessagesCount;
    bool isVerified = widget.chat.otherUser.isVerified;

    return Material(
      color: Colors.transparent,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 6),
        child: InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => DialogView(widget.chat.otherUser)
              )
              );
            },
            onLongPress: (){
              _menuController.open();
            },

            child: MenuAnchor(
              controller: _menuController,
                menuChildren: [
                  MenuItemButton(
                      leadingIcon: Icon(Icons.volume_up),
                      child: Text("Заглушить"),
                      onPressed: (){},
                  ),

                  MenuItemButton(
                    leadingIcon: Icon(Icons.delete),
                    child: Text("Удалить чат"),
                    onPressed: (){},
                  ),
                ],
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 14),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyCircleAvatar(
                      networkAsset: widget.chat.otherUser.photoPath,
                      radius: 30,
                    ),

                    Container(width: 12,),


                    Expanded(child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        VerifiedNameViewAsset(name: fullName, isVerified: isVerified),
                        Text(widget.chat.lastMessage, style: TextStyle(color: Colors.grey, fontSize: 14,), overflow: TextOverflow.ellipsis,),
                      ],
                    ),),
                    Padding(
                        padding: EdgeInsets.only(left: 8,top: 5),

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(date, style: TextStyle(color: Colors.grey, fontSize: 12,),),
                            newMessageCount > 0 ? Container(
                              padding: EdgeInsets.all(7),
                              decoration: BoxDecoration(
                                color: isLightTheme ? MyColors.darkbluetext : MyColors.darkThemeFont,
                                shape: BoxShape.circle,
                              ),
                              child: Text("2", style: TextStyle(
                                  color: isLightTheme ? Colors.white : Colors.black,
                                  fontSize: 14, fontWeight: FontWeight.bold
                              ),),
                            ) : Container()
                          ],

                        )
                    )
                  ],
                ),
              ),
            )
        ),
      )
    );
  }

  String formatMessageDate(DateTime messageDateTime) {
    DateTime now = DateTime.now();
    Duration difference = now.difference(messageDateTime);

    if (difference.inDays == 0) {
      // Сообщение отправлено сегодня
      return DateFormat.Hm('ru').format(messageDateTime); // Часы и минуты
    } else if (difference.inDays < 7) {
      // Сообщение отправлено на этой неделе
      return DateFormat.E('ru').format(messageDateTime); // День недели
    } else if (difference.inDays < 365){
      return DateFormat.MMMd('ru').format(messageDateTime); // День и месяц
    }
    else {
      // Сообщение отправлено ранее
      return DateFormat.yMMMd('ru').format(messageDateTime); // День и месяц
    }
  }
}
