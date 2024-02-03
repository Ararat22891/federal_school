import 'package:federal_school/Colors.dart';
import 'package:federal_school/features/ChatHome/Model/chatCellModel.dart';
import 'package:federal_school/features/ChatHome/Model/chatGroupCellModel.dart';
import 'package:federal_school/features/ChatHome/View/chatGroupCellView.dart';
import 'package:federal_school/features/ChatHome/View/chatMessageCellView.dart';
import 'package:flutter/material.dart';

enum ChatType { message, group }


class ChatHomeView extends StatelessWidget {
  const ChatHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    Set<ChatType> selection = <ChatType>{ChatType.message};


    return Column(
        children: [
          SegmentedButton(
                showSelectedIcon: false,
                style: ButtonStyle(
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  side: MaterialStatePropertyAll(BorderSide(color: MyColors.darkbluetext, width: 1)),
                  visualDensity: VisualDensity(horizontal: -2, vertical: -2),
                  backgroundColor: MaterialStateProperty.resolveWith(
                          (state){
                        if (state.contains(MaterialState.selected)){
                          return MyColors.darkbluetext;
                        }

                      }
                  ),
                  foregroundColor: MaterialStateProperty.resolveWith(
                          (state){
                        if (state.contains(MaterialState.selected)){
                          return Colors.white;
                        }
                        else if(!state.contains(MaterialState.selected)){
                          return MyColors.darkbluetext;
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
