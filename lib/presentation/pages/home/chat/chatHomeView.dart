import 'package:federal_school/presentation/Colors.dart';
import 'package:federal_school/domain/models/chat/chatCellModel.dart';
import 'package:federal_school/domain/models/chat/chatGroupCellModel.dart';
import 'package:federal_school/presentation/pages/home/chat/chatGroupCellView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../domain/states/home/chat/chatViewModel.dart';
import 'chatMessageCellView.dart';



class ChatHomeView extends StatelessWidget {
  ChatHomeView({super.key});

  ChatViewModel chatViewModel = ChatViewModel();

  @override
  Widget build(BuildContext context) {
    bool isLightTheme = Theme
        .of(context)
        .brightness == Brightness.light;

    return Column(
      children: [
        Observer(
            builder: (context){
              return SegmentedButton(
                showSelectedIcon: false,
                style: ButtonStyle(
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  side: MaterialStatePropertyAll(BorderSide(
                      color: isLightTheme ? MyColors.darkbluetext : Colors.white,
                      width: 1)),
                  visualDensity: VisualDensity(horizontal: -2, vertical: -2),
                  backgroundColor: MaterialStateProperty.resolveWith(
                          (state) {
                        if (state.contains(MaterialState.selected)) {
                          return isLightTheme ? MyColors.darkbluetext : Colors
                              .white;
                        }
                      }
                  ),
                  foregroundColor: MaterialStateProperty.resolveWith(
                          (state) {
                        if (state.contains(MaterialState.selected)) {
                          return isLightTheme ? Colors.white : Colors.black;
                        }
                        else if (!state.contains(MaterialState.selected)) {
                          return isLightTheme ? MyColors.darkbluetext : Colors
                              .white;
                        }
                      }
                  ),
                ),
                segments: [
                  ButtonSegment<ChatType>(
                      value: ChatType.message,
                      label: Text(
                        "Сообщения", style: TextStyle(fontWeight: FontWeight.bold),)
                  ),

                  ButtonSegment<ChatType>(
                      value: ChatType.group,
                      label: Text(
                        "Группы", style: TextStyle(fontWeight: FontWeight.bold),)
                  ),
                ],
                selected: <ChatType>{chatViewModel.selection},
                onSelectionChanged: chatViewModel.setTypeChat,
              );
            }
        ),

        Container(
          height: 10,
        ),

        Expanded(child: Observer(
            builder: (context){
              ChatCellModel.chats.sort((a,b) => b.sentTime.compareTo(a.sentTime));
              ChatGroupCellModel.groups.sort((a,b) => b.sentDateTime.compareTo(a.sentDateTime));

              return chatViewModel.selection == ChatType.message ? ListView.builder(
                  itemCount: ChatCellModel.chats.length,
                  itemBuilder: (context, index) {
                    return ChatMesageCellView(chat: ChatCellModel.chats[index]);
                  }
              ) :
              ListView.builder(
                itemCount: ChatGroupCellModel.groups.length,
                itemBuilder: (context, index) {
                  return Container(
                    color: Colors.transparent,
                    margin: EdgeInsets.symmetric(vertical: 6),
                    child: ChatGroupCellView(
                      group: ChatGroupCellModel.groups[index],),
                  );
                },
              );

            }
        ))
      ],

    );
  }
}
