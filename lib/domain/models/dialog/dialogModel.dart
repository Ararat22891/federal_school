
class DialogModel{
  String _uuid;
  String _userUUID;
  String _imageUrl;
  String _message;
  DateTime _sentTime;

  DialogModel(this._uuid, this._userUUID,  this._imageUrl, this._message, this._sentTime);

  DateTime get sentTime => _sentTime;

  String get message => _message;

  String get imageUrl => _imageUrl;

  String get uuid => _uuid;

  String get userUUID => _userUUID;

  static List<DialogModel> dialogs = [
    DialogModel("asasa", "dlassdl", "https://cdn.forbes.ru/files/c/998x924/profile/39-pavel-durov-182-05_2019.jpg__1555317023__31719.webp",
        "Привет", DateTime(2024, 1, 6, 12, 44)),

    DialogModel("dasdsa", "dasdal;d", "https://cdn.rxntxhj78z0b8muk.dprofile.ru/storage/673/profile/4f7566c26fc3d23d6b51a34458b92780e4edbe6c.jpg",
        "ООО ПАШАААА ДУУУУРОВ", DateTime(2024, 1, 6, 13, 43)),


    DialogModel("asasa", "dlassdl", "https://cdn.forbes.ru/files/c/998x924/profile/39-pavel-durov-182-05_2019.jpg__1555317023__31719.webp",
        "Приглашаю тебя в команду Telegram!", DateTime(2024, 1, 6, 13, 56)),

    DialogModel("dasdsa", "dasdal;d", "https://cdn.rxntxhj78z0b8muk.dprofile.ru/storage/673/profile/4f7566c26fc3d23d6b51a34458b92780e4edbe6c.jpg",
        "Правда????", DateTime(2024, 1, 6, 14, 2)),

    DialogModel("asasa", "dlassdl", "https://cdn.forbes.ru/files/c/998x924/profile/39-pavel-durov-182-05_2019.jpg__1555317023__31719.webp",
        "Да, конечно!", DateTime(2024, 1, 6, 14, 5)),

    DialogModel("dasdsa", "dasdal;d", "https://cdn.rxntxhj78z0b8muk.dprofile.ru/storage/673/profile/4f7566c26fc3d23d6b51a34458b92780e4edbe6c.jpg",
        "Это правда ты?", DateTime(2024, 1, 6, 14, 10)),

  ];
}