import 'package:federal_school/presentation/Colors.dart';
import 'package:federal_school/domain/models/chat/chatCellModel.dart';
import 'package:federal_school/domain/models/chat/chatGroupCellModel.dart';
import 'package:federal_school/presentation/pages/home/chat/chatGroupCellView.dart';
import 'package:flutter/material.dart';

import 'chatMessageCellView.dart';

enum ChatType { message, group }


class ChatHomeView extends StatelessWidget {
  const ChatHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    Set<ChatType> selection = <ChatType>{ChatType.message};
    bool isLightTheme = Theme.of(context).brightness == Brightness.light;
    return Column(
        children: [
          SegmentedButton(
                showSelectedIcon: false,
                style: ButtonStyle(
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  side: MaterialStatePropertyAll(BorderSide(
                      color: isLightTheme ? Colors.white : MyColors.darkbluetext, width: 1)),
                  visualDensity: VisualDensity(horizontal: -2, vertical: -2),
                  backgroundColor: MaterialStateProperty.resolveWith(
                          (state){
                        if (state.contains(MaterialState.selected)){
                          return isLightTheme ?  MyColors.darkbluetext: Colors.white;
                        }

                      }
                  ),
                  foregroundColor: MaterialStateProperty.resolveWith(
                          (state){
                        if (state.contains(MaterialState.selected)){
                          return isLightTheme ? Colors.white :  Colors.black;
                        }
                        else if(!state.contains(MaterialState.selected)){
                          return isLightTheme ? MyColors.darkbluetext : Colors.white;
                        }
                      }
                  ),
                ),
                segments:[
                  ButtonSegment(
                      value: ChatType.message,
                      label: Text("Сообщения", style: TextStyle( fontWeight: FontWeight.bold),)
                  ),

                  ButtonSegment(
                      value: ChatType.group,
                      label: Text("Группы", style: TextStyle( fontWeight: FontWeight.bold),)
                  ),


                ],
                selected: selection
            ),
          Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: ChatCellModel.chats.length,
                    itemBuilder: (context, index){
                      return ChatMesageCellView(chat: ChatCellModel.chats[index]);
                    }
                ),

          ),

          // Expanded(
          //     child: ListView.builder(
          //         shrinkWrap: true,
          //         itemCount: ChatGroupCellModel.groups.length,
          //         itemBuilder: (context, index){
          //           return Container(
          //             margin: EdgeInsets.symmetric(vertical: 6),
          //             child: ChatGroupCellView(group: ChatGroupCellModel.groups[index],),
          //           );
          //         },
          //
          //     )
          // )



        ],

    );
  }
}
