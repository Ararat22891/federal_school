
import 'package:federal_school/domain/models/user/user.dart';

class ChatCellModel{
  User _user;
  String _lastMessage;
  DateTime _sentTime;
  int _newMessagesCount;

  ChatCellModel(this._user, this._lastMessage, this._sentTime,
      this._newMessagesCount);

  int get newMessagesCount => _newMessagesCount;
  DateTime get sentTime => _sentTime;
  String get lastMessage => _lastMessage;
  User get user => _user;


  static var chats = [
   ChatCellModel(
       User.users[0],
       "Привет! Отлично отдохнул на Майами",
       DateTime(2004, 12, 11),
       4
   ),

    ChatCellModel(
        User.users[1],
        "Привет! Не кури бамбук",
        DateTime(2023, 12, 21),
        13
    ),

    ChatCellModel(
        User.users[2],
        "Ты крутой чел! Люблю тебя ",
        DateTime(2024, 2, 7),
        1
    ),

    ChatCellModel(
        User.users[3],
        "Я типо не читаю",
        DateTime(2024, 1, 7),
        0
    ),
  ];
}