
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;


enum UserRole {non_pupil, user, prepod, moder}

String getRole(int roleId){
  List<String> roles = ["Пользователь", "Студент", "Преподаватель", "Модератор"];
  return roles[roleId];
}

class UserData{
  String userUID;
  String? surname;
  String? name;
  String? patronomyc;
  String? photoPath;
  String telNumber;
  int? role; // 0 - non-pupil ,1 - user, 2 – prepod/curator, 3 - moder

   UserData({
    required this.userUID,
    this.surname,
    this.name,
    this.patronomyc,
    this.photoPath,
    required this.telNumber,
    this.role
  });



  factory UserData.fromFirebaseAuthUser(
      firebase_auth.User firebaseUser,
      ) {
    return UserData(
        userUID: firebaseUser.uid,
        telNumber: firebaseUser.phoneNumber!,
    );
  }



  static List<UserData> users = [
    UserData(
        userUID: "sasdfdafa",
        surname: "Gubaidullin",
        name: "Airat",
        patronomyc: "Floridovich",
        photoPath: "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6e/Kaiser_Wilhelm_II_of_Germany_-_1902.jpg/274px-Kaiser_Wilhelm_II_of_Germany_-_1902.jpg",
        telNumber: "+79600777466",
        role: 0
    ),

    UserData(userUID:"safkaklfafkkmfsakf",
        surname: "Утеев",
        name: "Тимур",
        patronomyc: "Сергеевич",
        photoPath: "https://cdn.rxntxhj78z0b8muk.dprofile.ru/storage/673/profile/4f7566c26fc3d23d6b51a34458b92780e4edbe6c.jpg",
        telNumber:"+79638291036",
        role: 1
    ),

    UserData(userUID: "d;lasd,a;ldlal;",
        surname: "Явлинский",
        name: "Григорий",
        patronomyc: "Алексеевич",
        photoPath: "https://www.yavlinsky.ru/wp-content/uploads/2019/06/president2018-scaled-e1661079553751.jpg",
        telNumber: "+79653877466",
        role: 2
    ),

    UserData(userUID: "dasm.m43mkldas",
        surname: "Гончаров",
        name: "Кирилл",
        patronomyc: "Алексеевич",
        photoPath: "https://www.yabloko.ru/files/users/user165/goncharov.jpg",
        telNumber: "+79600839426",
        role: 3
    ),
  ];
}