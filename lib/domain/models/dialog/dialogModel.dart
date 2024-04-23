
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