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



  ObservableList<ChatCellModel> chats = ObservableList();

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
                messUser.clear();
                chatId.clear();
                for (var chat in messages.snapshot.children) {
                  var all = chat.key!.split("_");
                  if (all.contains(user.uid)) {
                    chatId.add(all.join("_"));
                    all.remove(user.uid);
                    messUser.add(all.first);
                  }
                }

                if(chatId.length == 0){
                  chats.clear();
                }
                else {
                  for (int i = 0; i < chatId.length; i++) {
                    var getted = await FirebaseDatabase.instance.ref("chats")
                        .child(
                        chatId[i])
                        .get();
                    int unreadMessages = 0;

                    for (var j in getted.children) {
                      if (j.key == "unread") {
                        unreadMessages = j.value as int;
                      }
                    }


                    var iss = getted.children.length - 2;

                    var gettedMap = Map<String, dynamic>.from(
                        getted.children
                            .elementAt(iss)
                            .value as Map
                    );

                    var dialog = DialogModel.fromJson(gettedMap);

                    var otherUserInfo = await FirebaseDatabase.instance.ref(
                        'users')
                        .child(messUser[i])
                        .get();

                    var otherUserMap = Map<String, dynamic>.from(
                        otherUserInfo.value as Map);
                    var otherUser = UserData.fromJson(otherUserMap);
                    late ChatCellModel item;

                    if(dialog.senderUID == user.uid){
                       item = ChatCellModel(
                          dialog.chatUid,
                          otherUser, dialog.message, dialog.sentTime,
                          0, dialog.readStatus,
                          dialog.senderUID
                       );
                    }
                    else{
                       item = ChatCellModel(
                          dialog.chatUid,
                          otherUser, dialog.message, dialog.sentTime,
                          unreadMessages, dialog.readStatus,
                           dialog.senderUID

                       );
                    }





                    if (
                    chats.any((element) => element.uid == item.uid)
                    ) {
                      var changeChat = chats.where((element) =>
                      element.uid == item.uid);
                      int index = chats.indexOf(changeChat.first);
                      chats[index] = item;
                    }

                    else {
                      chats.add(item);
                    }
                  }
                }


                if (chats.length == 0)
                  status = ChatStatus.empty;
                else
                  status = ChatStatus.got;

        }
    );


  }
}
