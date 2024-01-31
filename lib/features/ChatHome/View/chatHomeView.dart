import 'package:federal_school/Colors.dart';
import 'package:federal_school/features/ChatHome/View/chatMessageCellView.dart';
import 'package:flutter/material.dart';

enum ChatType { message, group }


class ChatHomeView extends StatelessWidget {
  const ChatHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    Set<ChatType> selection = <ChatType>{ChatType.message};


    return Container(
      padding: EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))
      ),
      child: Column(
        children: [
          SegmentedButton(
            showSelectedIcon: false,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith(
                  (state){
                    if (state.contains(MaterialState.selected)){
                      return MyColors.darkbluetext;
                    }
                  }
              ),
            ),
              segments:[
                ButtonSegment(
                    value: ChatType.message,
                    label: Text("Сообщения", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)
                ),

                ButtonSegment(
                    value: ChatType.group,
                    label: Text("Группы", style: TextStyle(color: MyColors.darkbluetext, fontWeight: FontWeight.bold),)
                ),


              ],
              selected: selection
          ),
          ChatMesageCellView(),
        ],
      ),
    );
  }
}
