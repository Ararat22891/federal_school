import 'package:federal_school/domain/models/contact/contactModel.dart';

enum UserRole {non_pupil, user, prepod, moder}

String getRole(int roleId){
  List<String> roles = ["Пользователь", "Студент", "Преподаватель", "Модератор"];
  return roles[roleId];
}

class UserData{
  String userUID;
  String deviceToken;
  String? surname;
  String? name;
  String? patronomyc;
  String? photoPath;
  String telNumber;
  List<ContactModel>? contacts;
  int? role;// 0 - non-pupil ,1 - user, 2 – prepod/curator, 3 - moder



   UserData({
    required this.userUID,
     required this.deviceToken,
    this.surname,
    this.name,
    this.patronomyc,
    this.photoPath,
    required this.telNumber,
     this.contacts,
    this.role
  });


  Map<String, dynamic> toJson() {
    return {
      'userUID': userUID,
      'deviceToken': deviceToken,
      'surname': surname,
      'name': name,
      'patronomyc': patronomyc,
      'photoPath': photoPath,
      'contacts': contacts,
      'telNumber': telNumber,
      'role': role
    };
  }

  static UserData fromJson(Map<String, dynamic> json) {
    return UserData(
      userUID: json['userUID'],
      deviceToken: json['deviceToken'],
      surname: json['surname'],
      name: json['name'],
      patronomyc: json['patronomyc'],
      photoPath: json['photoPath'],
      telNumber: json['telNumber'],
      contacts: json['contacts'] != null
          ? List<ContactModel>.from(
          json['contacts'].map((x) => ContactModel.fromJson(x)))
          : null,
      role: json['role'],
    );
  }





  static List<UserData> users = [
    UserData(
        userUID: "sasdfdafa",
        deviceToken: "dasdasd",
        surname: "Gubaidullin",
        name: "Airat",
        patronomyc: "Floridovich",
        photoPath: "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6e/Kaiser_Wilhelm_II_of_Germany_-_1902.jpg/274px-Kaiser_Wilhelm_II_of_Germany_-_1902.jpg",
        telNumber: "+79600777466",
        role: 0
    ),

    UserData(userUID:"safkaklfafkkmfsakf",
        surname: "Утеев",
        deviceToken: "dasdasd",
        name: "Тимур",
        patronomyc: "Сергеевич",
        photoPath: "https://cdn.rxntxhj78z0b8muk.dprofile.ru/storage/673/profile/4f7566c26fc3d23d6b51a34458b92780e4edbe6c.jpg",
        telNumber:"+79638291036",
        role: 1
    ),

    UserData(userUID: "d;lasd,a;ldlal;",
        surname: "Явлинский",
        deviceToken: "dasdasd",
        name: "Григорий",
        patronomyc: "Алексеевич",
        photoPath: "https://www.yavlinsky.ru/wp-content/uploads/2019/06/president2018-scaled-e1661079553751.jpg",
        telNumber: "+79653877466",
        role: 2
    ),

    UserData(userUID: "dasm.m43mkldas",
        deviceToken: "dasdasd",
        surname: "Гончаров",
        name: "Кирилл",
        patronomyc: "Алексеевич",
        photoPath: "https://www.yabloko.ru/files/users/user165/goncharov.jpg",
        telNumber: "+79600839426",
        role: 3
    ),
  ];
}