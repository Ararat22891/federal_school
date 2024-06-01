import 'package:federal_school/domain/models/user/user.dart';

enum ReadStatus {sent, read, error}

ReadStatus getReadStatus(int status){
  switch(status){
    case 0:
      return ReadStatus.sent;
    case 1:
      return ReadStatus.read;
    case 2:
      return ReadStatus.error;
  }
  return ReadStatus.error;
}


class FullChat{
  int unread;
  List<DialogModel> dialogs;

  FullChat({required this.unread, required this.dialogs});

  static FullChat fromJson(Map<String, dynamic> json) {
    int unread = json['unread'];
    List<DialogModel> dialogs = [];


    json.forEach((key, value) {
      if(key != "unread") {
        var j = Map<String, dynamic>.from(value);
        dialogs.add(
            DialogModel(
              uuid: j['uuid'] as String,
              chatUid: j['chatUid'] as String,
              userInfo: j['userInfo'] != null ? UserData.fromJson(
                  j['userInfo']) : null,
              senderUID: j['senderUid'] as String,
              message: j['message'] as String,
              sentTime: DateTime.parse(j['sentTime']),
              readStatus: j['readStatus'] as int,
            ));
      }

    });

    return FullChat(
        unread: unread,
        dialogs: dialogs
    );
  }
}

class DialogModel{
  String uuid;
  String chatUid;
  UserData? userInfo;
  String message;
  String senderUID;
  DateTime sentTime;
  int readStatus;

  DialogModel(
  {
    required this.uuid,
    required this.chatUid,
    this.userInfo,
    required this.senderUID,
    required this.message,
    required this.sentTime,
    required this.readStatus
}
      );


  static DialogModel fromJson(Map<String, dynamic> json) {
    return DialogModel(
      uuid:  json['uuid'] as String,
      chatUid: json['chatUid'] as String,
      userInfo:  json['userInfo'] != null ? UserData.fromJson(json['userInfo']) : null,
      senderUID: json['senderUid'] as String,
      message:  json['message'] as String,
      sentTime:  DateTime.parse(json['sentTime']),
      readStatus:  json['readStatus'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uuid': uuid,
      'chatUid': chatUid,
      'userInfo': userInfo != null ? userInfo!.toJson() : null,
      'senderUid': senderUID,
      'message': message,
      'sentTime': sentTime.toIso8601String(),
      'readStatus': readStatus,
    };
  }
}