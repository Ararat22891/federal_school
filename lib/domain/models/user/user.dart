
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;


enum UserRole {non_pupil, user, prepod, moder}

String getRole(int roleId){
  List<String> roles = ["Пользователь", "Студент", "Преподаватель", "Модератор"];
  return roles[roleId];
}

class UserData{
  String userUID;
  String firebaseToken;
  String? surname;
  String? name;
  String? patronomyc;
  String? photoPath;
  String telNumber;
  int? role; // 0 - non-pupil ,1 - user, 2 – prepod/curator, 3 - moder

   UserData({
    required this.userUID,
     required this.firebaseToken,
    this.surname,
    this.name,
    this.patronomyc,
    this.photoPath,
    required this.telNumber,
    this.role
  });



  static List<UserData> users = [
    UserData(
        userUID: "sasdfdafa",
        firebaseToken: "czfzODCJRiKzrfNvKcUNpq:APA91bHy-fwezLGcW-bInZxn7fKl5XqaulrogGZii5KgQzX539gLkcPWG2NhM1XS7W-WLaj6K4wTE26osvHqOi14cXUZu8CbnwDI2uJ313h8-f5JTEJpXssYja1yW4Yxm5BFMxbNQaoM",
        surname: "Gubaidullin",
        name: "Airat",
        patronomyc: "Floridovich",
        photoPath: "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6e/Kaiser_Wilhelm_II_of_Germany_-_1902.jpg/274px-Kaiser_Wilhelm_II_of_Germany_-_1902.jpg",
        telNumber: "+79600777466",
        role: 0
    ),

    UserData(userUID:"safkaklfafkkmfsakf",
        surname: "Утеев",
        firebaseToken: "eUJChTCITT-m1N5wJtBxQV:APA91bFwJ5wLEnPStkhjaRrIRftmO2_o-6CZAW4uIQDvyWZhdVZR8k8guytyt8kfkzoozAyN7AgloJtykzTPbEE1gNMXJIyCYbbsK-jFjlRDPezrkEOZ249GwpSu04MA9GkdDq9CGulD",
        name: "Тимур",
        patronomyc: "Сергеевич",
        photoPath: "https://cdn.rxntxhj78z0b8muk.dprofile.ru/storage/673/profile/4f7566c26fc3d23d6b51a34458b92780e4edbe6c.jpg",
        telNumber:"+79638291036",
        role: 1
    ),

    UserData(userUID: "d;lasd,a;ldlal;",
        surname: "Явлинский",
        firebaseToken: "czfzODCJRiKzrfNvKcUNpq:APA91bHy-fwezLGcW-bInZxn7fKl5XqaulrogGZii5KgQzX539gLkcPWG2NhM1XS7W-WLaj6K4wTE26osvHqOi14cXUZu8CbnwDI2uJ313h8-f5JTEJpXssYja1yW4Yxm5BFMxbNQaoM",
        name: "Григорий",
        patronomyc: "Алексеевич",
        photoPath: "https://www.yavlinsky.ru/wp-content/uploads/2019/06/president2018-scaled-e1661079553751.jpg",
        telNumber: "+79653877466",
        role: 2
    ),

    UserData(userUID: "dasm.m43mkldas",
        firebaseToken: "czfzODCJRiKzrfNvKcUNpq:APA91bHy-fwezLGcW-bInZxn7fKl5XqaulrogGZii5KgQzX539gLkcPWG2NhM1XS7W-WLaj6K4wTE26osvHqOi14cXUZu8CbnwDI2uJ313h8-f5JTEJpXssYja1yW4Yxm5BFMxbNQaoM",
        surname: "Гончаров",
        name: "Кирилл",
        patronomyc: "Алексеевич",
        photoPath: "https://www.yabloko.ru/files/users/user165/goncharov.jpg",
        telNumber: "+79600839426",
        role: 3
    ),
  ];
}