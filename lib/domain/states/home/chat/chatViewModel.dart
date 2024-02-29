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

  @action
  void setTypeChat(Set<ChatType> chatType) {
    selection = chatType.first;
  }

  @action
  Future<void> getChatList() async{
    User user = FirebaseAuth.instance.currentUser!;
    List<String> chatId = [];

    await FirebaseDatabase.instance.ref("chats").onValue.listen(
            (event) {
              chats.clear();
              for(var child in event.snapshot.children){
                  chatId = child.key!.split("_");
                  chatId.sort();
                  if(chatId.contains(user.uid)){
                    final allMessagesRef = FirebaseDatabase.instance
                        .ref("chats/${child.key}")
                        .orderByChild("sentTime");

                    allMessagesRef.onValue.listen(
                            (data) {
                              var map = Map<String, dynamic>.from(data.snapshot.children.last.value as Map);
                              var dialog = DialogModel.fromJson(map);

                              FirebaseDatabase.instance.ref("users").child(chatId.first).get().then(
                                      (value){
                                        print(value);
                                        var otherUserMap = Map<String,dynamic>.from(value.value as Map);
                                        var otherUser = UserData.fromJson(otherUserMap);
                                        var item = ChatCellModel(
                                            otherUser,
                                            dialog.message,
                                            dialog.sentTime,
                                            0
                                        );
                                        chats.add(item);
                                        isDataLoaded = true;
                                      }
                              );


                            }
                    );


                  }
              }
            }
    );
  }
}
