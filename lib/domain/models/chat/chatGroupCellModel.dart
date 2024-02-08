
import 'package:federal_school/domain/models/user/user.dart';
import 'package:intl/intl.dart';

class ChatGroupCellModel{
  int _groupID;
  String _imageUrl;
  String _groupName;
  String _lastMessageWithSender;
  int _participantCount;
  DateTime _sentDateTime;
  int _newMessageCount;

  ChatGroupCellModel(
      this._groupID,
      this._imageUrl,
      this._groupName,
      this._lastMessageWithSender,
      this._participantCount,
      this._sentDateTime,
      this._newMessageCount);

  int get newMessageCount => _newMessageCount;
  DateTime get sentDateTime => _sentDateTime;
  int get participantCount => _participantCount;
  String get lastMessageWithSender => _lastMessageWithSender;
  String get groupName => _groupName;
  String get imageUrl => _imageUrl;
  int get groupID => _groupID;
  
  static List<ChatGroupCellModel> groups = [
    ChatGroupCellModel(1,
        "https://yt3.googleusercontent.com/grf0u0HVtPZQ1JyM1ANH_7Q8Xu64lwscvTXwcXlW5ejz8-C7lmiF4gVijgSbeEpnS9Y5Wy4=s900-c-k-c0x00ffffff-no-rj",
        "ФПШ",
        "Айрат Губайдуллин: Мне не удобно в это время, может в 17?",
        22, DateTime.now(), 5),

    ChatGroupCellModel(2,
        "https://im.kommersant.ru/Issues.photo/MONEY/2015/009/KMO_146991_00063_1_t218_161258.jpg",
        "Уютный чат друзей Гончарова", "Кирилл Гончаров: Хорошая идея! Берусь",
        12, DateTime.now(), 3),
  ];



  String formatMessageDate(DateTime messageDateTime) {
    DateTime now = DateTime.now();
    Duration difference = now.difference(messageDateTime);

    if (difference.inDays == 0) {
      // Сообщение отправлено сегодня
      return DateFormat.Hm('ru').format(messageDateTime); // Часы и минуты
    } else if (difference.inDays < 7) {
      // Сообщение отправлено на этой неделе
      return DateFormat.E('ru').format(messageDateTime); // День недели
    } else if (difference.inDays < 365){
      return DateFormat.MMMd('ru').format(messageDateTime); // День и месяц
    }
    else {
      // Сообщение отправлено ранее
      return DateFormat.yMMMd('ru').format(messageDateTime); // День и месяц
    }
  }
}