
enum UserRole {non_pupil, user, prepod, moder}

String getRole(int roleId){
  List<String> roles = ["Пользователь", "Студент", "Преподаватель", "Модератор"];
  return roles[roleId];
}

class User{
  String _userUID;
  String _surname;
  String _name;
  String _patronomyc;
  String _photoPath;
  String _telNumber;
  int _role; // 0 - non-pupil ,1 - user, 2 – prepod/curator, 3 - moder

  User(this._userUID, this._surname, this._name, this._patronomyc, this._photoPath,
      this._telNumber, this._role);

  int get role => _role;

  String get telNumber => _telNumber;

  String get patronomyc => _patronomyc;

  String get name => _name;

  String get photoPath => _photoPath;

  String get surname => _surname;

  String get userUID => _userUID;



  static List<User> users = [
    User("sasdfdafa",
        "Gubaidullin",
        "Airat",
        "Floridovich",
        "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6e/Kaiser_Wilhelm_II_of_Germany_-_1902.jpg/274px-Kaiser_Wilhelm_II_of_Germany_-_1902.jpg",
        "+79600777466",
        0
    ),

    User("safkaklfafkkmfsakf",
        "Утеев",
        "Тимур",
        "Сергеевич",
        "https://cdn.rxntxhj78z0b8muk.dprofile.ru/storage/673/profile/4f7566c26fc3d23d6b51a34458b92780e4edbe6c.jpg",
        "+79638291036",
        1
    ),

    User("d;lasd,a;ldlal;",
        "Явлинский",
        "Григорий",
        "Алексеевич",
        "https://www.yavlinsky.ru/wp-content/uploads/2019/06/president2018-scaled-e1661079553751.jpg",
        "+79653877466",
        2
    ),

    User("dasm.m43mkldas",
        "Гончаров",
        "Кирилл",
        "Алексеевич",
        "https://www.yabloko.ru/files/users/user165/goncharov.jpg",
        "+79600839426",
        3
    ),
  ];
}