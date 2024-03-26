import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

import '../../../../models/dialog/dialogModel.dart';

part 'dialogViewModel.g.dart';

class DialogViewModel = _DialogViewModel with _$DialogViewModel;

abstract class _DialogViewModel with Store {

  @observable
  bool isDataLoaded = false;


  @observable
  List<DialogModel> dialogs = [];

  @observable
  late TextEditingController controller;

  ScrollController scrollController= ScrollController();


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
    print(chatUID);
    FirebaseDatabase.instance.ref("chats").child(chatUID).onValue.listen(
            (event) {
              dialogs.clear();
              isDataLoaded = false;
              event.snapshot.children;
              for (final child in event.snapshot.children){
                final data = Map<String, dynamic>.from(child.value as Map);
                DialogModel userData = DialogModel.fromJson(data);
                dialogs.add(userData);
              }
              isDataLoaded = true;

            }
    );
  }

  @action
  Future<void> sendMessage (String myUid, String foreignUID) async{
    List<String> sorted = [myUid, foreignUID]..sort();
    String chatUID = "${sorted.first}_${sorted[1]}";
    print(chatUID);
    var ref = FirebaseDatabase.instance.ref("chats").child(chatUID).push();
    ref.set(
      DialogModel(uuid: ref.key!, senderUID: myUid, message: controller.text, sentTime: DateTime.now(), readStatus: 0).toJson()
    );
    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
    duration: Duration(seconds: 2),
    curve: Curves.fastOutSlowIn,
    );
    controller.clear();
  }
}
