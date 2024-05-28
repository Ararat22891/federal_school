import 'dart:isolate';

import 'package:federal_school/data/notifications/sendNotification.dart';
import 'package:federal_school/data/userDataSingltone.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

import '../../../../models/dialog/dialogModel.dart';
import '../../../../models/user/user.dart';

part 'dialogViewModel.g.dart';

class DialogViewModel = _DialogViewModel with _$DialogViewModel;

abstract class _DialogViewModel with Store {

  @observable
  bool isDataLoaded = false;


  @observable
  ObservableList<DialogModel> dialogs = ObservableList();

  @observable
  late TextEditingController controller;

  late ScrollController scrollController;


  @observable
  bool isSendable = false;


  @action
  void onChanged(String text){
    if (text.isNotEmpty){
      isSendable = true;
    }
    else isSendable = false;
  }

  @action
  void getMessages(String myUid, String foreignUID){
    List<String> sorted = [myUid, foreignUID]..sort();
    String chatUID = "${sorted.first}_${sorted[1]}";
    FirebaseDatabase.instance.ref("chats").child(chatUID).onValue.listen(
            (event) {
              dialogs.clear();
              isDataLoaded = false;
              for (final child in event.snapshot.children){
                if(child.key != "unread") {
                  final data = Map<String, dynamic>.from(child.value as Map);
                  DialogModel userData = DialogModel.fromJson(data);
                  dialogs.add(userData);
                }
              }
              dialogs.sort((d1, d2){
                var dat1 = DateTime(d1.sentTime.year, d1.sentTime.month, d1.sentTime.day, d1.sentTime.hour, d1.sentTime.minute);
                var dat2 = DateTime(d2.sentTime.year, d2.sentTime.month, d2.sentTime.day, d2.sentTime.hour, d2.sentTime.minute);

                return dat1.compareTo(dat2);

              });
              isDataLoaded = true;

            }
    );
  }

  @action
  Future<void> sendMessage (String myUid, UserData userData) async{
    List<String> sorted = [myUid, userData.userUID]..sort();
    String chatUID = "${sorted.first}_${sorted[1]}";
    print(chatUID);
    var ref = FirebaseDatabase.instance.ref("chats").child(chatUID);
    var n = await ref.child("unread").get();
    if(n.exists){
      int count = n.value as int;
      count++;
      await ref.update({
        "unread": count
      }
      );
    }
    else{
      ref.update({
        "unread": 1
      }
      );
    }



    var newRef = ref.push();

    newRef.set(
      DialogModel(uuid: newRef.key!, chatUid: chatUID, senderUID: myUid, message: controller.text, sentTime: DateTime.now(), readStatus: 0).toJson()
    );
    scrollController.animateTo(
      scrollController.position.minScrollExtent,
    duration: Duration(seconds: 2),
    curve: Curves.fastOutSlowIn,
    );

    var myData = GlobalSingltone.getInstanse().instance;
    var fi = myData?.surname == null ? "неизвестного пользователя" : "${myData!.surname} ${myData.name}";
    var myFio = "Новое сообщение от $fi";
    var data = {
      "type": "Сообщение",
      "message": controller.text,
      "sender": myFio,
      "chatUID": chatUID
    };
    controller.clear();
    await send(userData.deviceToken, data);

  }

  @action
  Future<void> getReadedMessage(DialogModel dialogModel, bool isMe) async{
    if(dialogModel.readStatus == 0 && !isMe){

      await FirebaseDatabase.instance.ref("chats").child(dialogModel.chatUid)
          .child(dialogModel.uuid).update({
        'readStatus': 1
      });

      var ref = FirebaseDatabase.instance.ref("chats").child(dialogModel.chatUid);
      var n = await ref.child("unread").get();
      if(n.exists){
        await ref.update({
          "unread": 0
        }
        );
      }
      else{
        await ref.update({
          "unread": 0
        }
        );
      }
      dialogModel.readStatus = 1;
    }
  }
}
