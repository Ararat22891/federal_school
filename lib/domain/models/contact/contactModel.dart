

class ContactModel{
  int _id;
  String _imageUrl;
  String _name;
  String _phoneNumber;

  ContactModel(this._id, this._imageUrl, this._name, this._phoneNumber);

  String get phoneNumber => _phoneNumber;

  String get name => _name;

  String get imageUrl => _imageUrl;

  int get id => _id;
  
  
  static List<ContactModel> contacts = [
    ContactModel(0, "https://static.mk.ru/upload/entities/2018/06/07/articles/detailPicture/95/72/ce/d7/58bcc7d521cd08692d9364476a060077.jpg",
        "Павел Дуров", "+79656284935"),
    ContactModel(1, "https://www.yavlinsky.ru/wp-content/uploads/2019/06/president2018-scaled-e1661079553751.jpg",
        "Григорий Явлинский", "+79654584935"),
    ContactModel(2, "https://static.mk.ru/upload/entities/2018/06/07/articles/detailPicture/95/72/ce/d7/58bcc7d521cd08692d9364476a060077.jpg",
        "Павел Дуров", "+79656284935"),
    ContactModel(3, "https://static.mk.ru/upload/entities/2018/06/07/articles/detailPicture/95/72/ce/d7/58bcc7d521cd08692d9364476a060077.jpg",
        "Павел Дуров", "+79656284935"),
    ContactModel(4, "https://static.mk.ru/upload/entities/2018/06/07/articles/detailPicture/95/72/ce/d7/58bcc7d521cd08692d9364476a060077.jpg",
        "Павел Дуров", "+79656284935"),
  ];
}