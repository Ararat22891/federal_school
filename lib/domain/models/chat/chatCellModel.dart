

import '../user/user.dart';

class ChatCellModel{
  UserData otherUser;
  String lastMessage;
  DateTime sentTime;
  int newMessagesCount;

  ChatCellModel(this.otherUser,  this.lastMessage, this.sentTime,
      this.newMessagesCount);


  Map<String, dynamic> toJson() {
    return {
      'otherUser': otherUser,
      'lastMessage': lastMessage,
      'sentTime': sentTime.toIso8601String(),
      'newMessagesCount': newMessagesCount,
    };
  }

  factory ChatCellModel.fromJson(Map<String, dynamic> json) {
    return ChatCellModel(
      json['otherUser'],
      json['lastMessage'],
      DateTime.parse(json['sentTime']),
      json['newMessagesCount'],
    );
  }
}