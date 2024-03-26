import 'package:federal_school/domain/models/dialog/dialogModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';

import '../../../models/chat/chatCellModel.dart';
import '../../../models/user/user.dart';

part 'chatViewModel.g.dart';

class ChatViewModel = _ChatViewModel with _$ChatViewModel;

enum ChatType { message, group }

enum ChatStatus {empty, loading, got}

abstract class _ChatViewModel with Store {
  _ChatViewModel(){
    getChatList();
  }

  @observable
  ChatType selection = ChatType.message;

  @observable
  List<ChatCellModel> chats = [];

  @observable
  bool isDataLoaded = false;

  @observable
  ChatStatus status = ChatStatus.empty;

  @action
  void setTypeChat(Set<ChatType> chatType) {
    selection = chatType.first;
  }

  @action
  Future<void> getChatList() async {
    chats.clear();
    User user = FirebaseAuth.instance.currentUser!;
    List<String> chatId = [];


    status = ChatStatus.loading;

    List<String> messUser = [];


    FirebaseDatabase.instance
        .ref("chats")
        .onValue
        .listen(
            (messages) async {
          status = ChatStatus.loading;
          messUser.clear();
          chatId.clear();
          chats.clear();
          for (var chat in messages.snapshot.children) {
            var all = chat.key!.split("_");
            if (all.contains(user.uid)) {
              chatId.add(all.join("_"));
              all.remove(user.uid);
              messUser.add(all.first);
            }
          }

          for (int i = 0; i < chatId.length; i++) {
            var getted = await FirebaseDatabase.instance.ref("chats").child(
                chatId[i]).orderByChild("sentTime").get();
            var gettedMap = Map<String, dynamic>.from(
                getted.children.last.value as Map);
            print(gettedMap);
            var dialog = DialogModel.fromJson(gettedMap);

            var otherUserInfo = await FirebaseDatabase.instance.ref('users')
                .child(messUser[i])
                .get();

            var otherUserMap = Map<String, dynamic>.from(
                otherUserInfo.value as Map);
            var otherUser = UserData.fromJson(otherUserMap);

            ChatCellModel item = ChatCellModel(
                otherUser, dialog.message, dialog.sentTime, 0);
            chats.add(item);
          }

          if (chats.length == 0)
            status = ChatStatus.empty;
          else
            status = ChatStatus.got;
        }
    );


  }
}
