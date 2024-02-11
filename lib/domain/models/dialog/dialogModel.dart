
import 'package:federal_school/domain/models/user/user.dart';

class DialogModel{
  String _uuid;
  User _userInfo;
  String _message;
  DateTime _sentTime;

  DialogModel(this._uuid, this._userInfo,  this._message, this._sentTime);

  DateTime get sentTime => _sentTime;

  String get message => _message;


  String get uuid => _uuid;

  User get userInfo => _userInfo;

  static List<DialogModel> dialogs = [
    DialogModel("sasfasfa",
        User.users.first,
        "Привет Тимур!",
        DateTime(2024, 1, 6, 12, 44)
    ),


    DialogModel(",slafalfaf;l,afl",
        User.users.first,
        "Я тут глянул брат все хорошо!",
        DateTime(2024, 1, 6, 12, 45)
    ),

    DialogModel("lmflrelflrel",
        User.users[1],
        "Ты кто!",
        DateTime(2024, 1, 6, 12, 46)
    ),


    DialogModel(",slafalfaf;l,afl",
        User.users.first,
        "Я тут глянул брат все хорошо!",
        DateTime(2024, 1, 6, 12, 45)
    ),



  ];
}