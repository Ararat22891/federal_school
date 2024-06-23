
import 'package:federal_school/domain/models/complaint/complaintModel.dart';
import 'package:federal_school/domain/models/dialog/dialogModel.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'dialogAssetViewModel.g.dart';

class DialogAssetViewModel = _DialogAssetViewModel with _$DialogAssetViewModel;

abstract class _DialogAssetViewModel with Store{

  late MenuController menuController;
  Offset? _tapPosition;

  @action
  Future<void> showCustomMenu(BuildContext context) async {
    if (_tapPosition == null) {
      return;
    }
    menuController.open(position: _tapPosition);
  }

  @action
  void storePosition(TapDownDetails details) {
    _tapPosition = details.localPosition;
  }

  @action
  Future<void> deleteMessage(DialogModel dialogModel) async{
    await FirebaseDatabase.instance.ref("chats").child(dialogModel.chatUid).child(dialogModel.uuid).remove();
  }

  @action
  Future<void> complaintMessage(DialogModel dialogModel, String senderId) async{
    var ref = FirebaseDatabase.instance.ref("complaints").push();

    ComplaintModel complaint = ComplaintModel(chatUid: dialogModel.chatUid, messageUid: dialogModel.uuid, complaintSenderId: senderId, complaintId: ref.key!);
    await ref.set(
      complaint.toJson()
    );
  }
}