

import '../user/user.dart';

class ChatCellModel{
  String uid;
  UserData otherUser;
  String lastMessage;
  DateTime sentTime;
  int newMessagesCount;

  ChatCellModel(this.uid,this.otherUser,  this.lastMessage, this.sentTime,
      this.newMessagesCount);


  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'otherUser': otherUser,
      'lastMessage': lastMessage,
      'sentTime': sentTime.toIso8601String(),
      'newMessagesCount': newMessagesCount,
    };
  }

  factory ChatCellModel.fromJson(Map<String, dynamic> json) {
    return ChatCellModel(
      json['uid'],
      json['otherUser'],
      json['lastMessage'],
      DateTime.parse(json['sentTime']),
      json['newMessagesCount'],
    );
  }
}