import 'package:federal_school/presentation/Colors.dart';
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
    bool isLightTheme = Theme.of(context).brightness == Brightness.light;

    return Column(
      children: [
        Observer(builder: (context) {
          return SegmentedButton(
            showSelectedIcon: false,
            style: ButtonStyle(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              side: MaterialStatePropertyAll(BorderSide(
                  color: isLightTheme ? MyColors.darkbluetext : Colors.white,
                  width: 1)),
              visualDensity: VisualDensity(horizontal: -2, vertical: -2),
              backgroundColor: MaterialStateProperty.resolveWith((state) {
                if (state.contains(MaterialState.selected)) {
                  return isLightTheme ? MyColors.darkbluetext : Colors.white;
                }
                return null;
              }),
              foregroundColor: MaterialStateProperty.resolveWith((state) {
                if (state.contains(MaterialState.selected)) {
                  return isLightTheme ? Colors.white : Colors.black;
                } else if (!state.contains(MaterialState.selected)) {
                  return isLightTheme ? MyColors.darkbluetext : Colors.white;
                }
                return null;
              }),
            ),
            segments: const [
              ButtonSegment<ChatType>(
                  value: ChatType.message,
                  label: Text(
                    "Сообщения",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
              ButtonSegment<ChatType>(
                  value: ChatType.group,
                  label: Text(
                    "Группы",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
            ],
            selected: <ChatType>{chatViewModel.selection},
            onSelectionChanged: chatViewModel.setTypeChat,
          );
        }),
        Container(
          height: 10,
        ),

        Expanded(child: Observer(builder: (context) {
          return chatViewModel.selection == ChatType.message
              ? Observer(
              builder: (context){
                switch(chatViewModel.status){
                  case ChatStatus.empty:
                    return Container(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Column(

                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/empty_chat.png",),
                          Text('У вас нет новых сообщений, начните диалог через раздел "Контакты"', style: Theme.of(context).textTheme.titleMedium, textAlign: TextAlign.center,)

                        ],
                      ),
                    );
                  case ChatStatus.loading:
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  case ChatStatus.got:
                    chatViewModel.chats.sort(
                        (first,second){
                          return second.sentTime.compareTo(first.sentTime);
                        }
                    );
                    return ListView.builder(
                        itemCount: chatViewModel.chats.length,
                        itemBuilder: (context, index) {
                          return ChatMesageCellView(chat: chatViewModel.chats[index]);
                        });
                }
              }
          )
              : ListView.builder(
                  itemCount: ChatGroupCellModel.groups.length,
                  itemBuilder: (context, index) {
                    return Container(
                      color: Colors.transparent,
                      margin: EdgeInsets.symmetric(vertical: 6),
                      child: ChatGroupCellView(
                        group: ChatGroupCellModel.groups[index],
                      ),
                    );
                  },
                );
        }))
      ],
    );
  }
}
