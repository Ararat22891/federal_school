

import '../user/user.dart';

class ChatCellModel{
  String uid;
  UserData otherUser;
  String lastMessage;
  DateTime sentTime;
  int newMessagesCount;
  int readStatus;
  String senderID;

  ChatCellModel(this.uid,this.otherUser,  this.lastMessage, this.sentTime,
      this.newMessagesCount, this.readStatus, this.senderID);


  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'otherUser': otherUser,
      'lastMessage': lastMessage,
      'sentTime': sentTime.toIso8601String(),
      'newMessagesCount': newMessagesCount,
      'readStatus': readStatus,
      'senderID':senderID
    };
  }

  factory ChatCellModel.fromJson(Map<String, dynamic> json) {
    return ChatCellModel(
      json['uid'],
      json['otherUser'],
      json['lastMessage'],
      DateTime.parse(json['sentTime']),
      json['newMessagesCount'],
      json['readStatus'],
      json['senderID']
    );
  }
}