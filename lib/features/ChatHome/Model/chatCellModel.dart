
class ChatCellModel{
  String _imageUrl;
  String _name;
  String _lastMessage;
  String _sentTime;
  int _newMessagesCount;

  ChatCellModel(this._imageUrl, this._name, this._lastMessage, this._sentTime,
      this._newMessagesCount);

  int get newMessagesCount => _newMessagesCount;
  String get sentTime => _sentTime;
  String get lastMessage => _lastMessage;
  String get name => _name;
  String get imageUrl => _imageUrl;


  static var chats = [
    ChatCellModel("https://www.yavlinsky.ru/wp-content/uploads/2019/06/yavlinsky-nemcov-e1661081340605.jpg", "Григорий Явлинский", "Привет! Рад что все хорошалакадуадлудлалкдуалкдуадлкудладлкудалкулдадлуалдаудо", "10:12", 4),
    ChatCellModel("https://cdnn21.img.ria.ru/images/07e5/07/1b/1743041536_0:0:1501:845_1920x0_80_0_0_c8da787931e6cf9ec7741177af0bb147.jpg", "Кирилл Гончаров", "Чел надо мной лучший", "10:02", 1),
    ChatCellModel("https://www.yavlinsky.ru/wp-content/uploads/2019/06/yavlinsky-nemcov-e1661081340605.jpg", "Григорий Явлинский", "Привет! Рад что все хорошо", "10:12", 4),
    ChatCellModel("https://cdnn21.img.ria.ru/images/07e5/07/1b/1743041536_0:0:1501:845_1920x0_80_0_0_c8da787931e6cf9ec7741177af0bb147.jpg", "Кирилл Гончаров", "Чел надо мной лучший", "10:02", 1),
    ChatCellModel("https://www.yavlinsky.ru/wp-content/uploads/2019/06/yavlinsky-nemcov-e1661081340605.jpg", "Григорий Явлинский", "Привет! Рад что все хорошо", "10:12", 4),
    ChatCellModel("https://cdnn21.img.ria.ru/images/07e5/07/1b/1743041536_0:0:1501:845_1920x0_80_0_0_c8da787931e6cf9ec7741177af0bb147.jpg", "Кирилл Гончаров", "Чел надо мной лучший", "10:02", 1),
    ChatCellModel("https://www.yavlinsky.ru/wp-content/uploads/2019/06/yavlinsky-nemcov-e1661081340605.jpg", "Григорий Явлинский", "Привет! Рад что все хорошо", "10:12", 4),
    ChatCellModel("https://cdnn21.img.ria.ru/images/07e5/07/1b/1743041536_0:0:1501:845_1920x0_80_0_0_c8da787931e6cf9ec7741177af0bb147.jpg", "Кирилл Гончаров", "Чел надо мной лучший", "10:02", 1),
    ChatCellModel("https://www.yavlinsky.ru/wp-content/uploads/2019/06/yavlinsky-nemcov-e1661081340605.jpg", "Григорий Явлинский", "Привет! Рад что все хорошо", "10:12", 4),
    ChatCellModel("https://cdnn21.img.ria.ru/images/07e5/07/1b/1743041536_0:0:1501:845_1920x0_80_0_0_c8da787931e6cf9ec7741177af0bb147.jpg", "Кирилл Гончаров", "Чел надо мной лучший", "10:02", 1),
    ChatCellModel("https://www.yavlinsky.ru/wp-content/uploads/2019/06/yavlinsky-nemcov-e1661081340605.jpg", "Григорий Явлинский", "Привет! Рад что все хорошо", "10:12", 4),
    ChatCellModel("https://cdnn21.img.ria.ru/images/07e5/07/1b/1743041536_0:0:1501:845_1920x0_80_0_0_c8da787931e6cf9ec7741177af0bb147.jpg", "Кирилл Гончаров", "Чел надо мной лучший", "10:02", 1),
    ChatCellModel("https://www.yavlinsky.ru/wp-content/uploads/2019/06/yavlinsky-nemcov-e1661081340605.jpg", "Григорий Явлинский", "Привет! Рад что все хорошо", "10:12", 4),
    ChatCellModel("https://cdnn21.img.ria.ru/images/07e5/07/1b/1743041536_0:0:1501:845_1920x0_80_0_0_c8da787931e6cf9ec7741177af0bb147.jpg", "Кирилл Гончаров", "Чел надо мной лучший", "10:02", 1),
    ChatCellModel("https://www.yavlinsky.ru/wp-content/uploads/2019/06/yavlinsky-nemcov-e1661081340605.jpg", "Григорий Явлинский", "Привет! Рад что все хорошо", "10:12", 4),
    ChatCellModel("https://cdnn21.img.ria.ru/images/07e5/07/1b/1743041536_0:0:1501:845_1920x0_80_0_0_c8da787931e6cf9ec7741177af0bb147.jpg", "Кирилл Гончаров", "Чел надо мной лучший", "10:02", 1),
    ChatCellModel("https://www.yavlinsky.ru/wp-content/uploads/2019/06/yavlinsky-nemcov-e1661081340605.jpg", "Григорий Явлинский", "Привет! Рад что все хорошо", "10:12", 4),
    ChatCellModel("https://cdnn21.img.ria.ru/images/07e5/07/1b/1743041536_0:0:1501:845_1920x0_80_0_0_c8da787931e6cf9ec7741177af0bb147.jpg", "Кирилл Гончаров", "Чел надо мной лучший", "10:02", 1),
    ChatCellModel("https://www.yavlinsky.ru/wp-content/uploads/2019/06/yavlinsky-nemcov-e1661081340605.jpg", "Григорий Явлинский", "Привет! Рад что все хорошо", "10:12", 4),
    ChatCellModel("https://cdnn21.img.ria.ru/images/07e5/07/1b/1743041536_0:0:1501:845_1920x0_80_0_0_c8da787931e6cf9ec7741177af0bb147.jpg", "Кирилл Гончаров", "Чел надо мной лучший", "10:02", 1),
    ChatCellModel("https://www.yavlinsky.ru/wp-content/uploads/2019/06/yavlinsky-nemcov-e1661081340605.jpg", "Григорий Явлинский", "Привет! Рад что все хорошо", "10:12", 4),
    ChatCellModel("https://cdnn21.img.ria.ru/images/07e5/07/1b/1743041536_0:0:1501:845_1920x0_80_0_0_c8da787931e6cf9ec7741177af0bb147.jpg", "Кирилл Гончаров", "Чел надо мной лучший", "10:02", 1),
    ChatCellModel("https://www.yavlinsky.ru/wp-content/uploads/2019/06/yavlinsky-nemcov-e1661081340605.jpg", "Григорий Явлинский", "Привет! Рад что все хорошо", "10:12", 4),
    ChatCellModel("https://cdnn21.img.ria.ru/images/07e5/07/1b/1743041536_0:0:1501:845_1920x0_80_0_0_c8da787931e6cf9ec7741177af0bb147.jpg", "Кирилл Гончаров", "Чел надо мной лучший", "10:02", 1),
    ChatCellModel("https://www.yavlinsky.ru/wp-content/uploads/2019/06/yavlinsky-nemcov-e1661081340605.jpg", "Григорий Явлинский", "Привет! Рад что все хорошо", "10:12", 4),
    ChatCellModel("https://cdnn21.img.ria.ru/images/07e5/07/1b/1743041536_0:0:1501:845_1920x0_80_0_0_c8da787931e6cf9ec7741177af0bb147.jpg", "Кирилл Гончаров", "Чел надо мной лучший", "10:02", 1),
    ChatCellModel("https://www.yavlinsky.ru/wp-content/uploads/2019/06/yavlinsky-nemcov-e1661081340605.jpg", "Григорий Явлинский", "Привет! Рад что все хорошо", "10:12", 4),
    ChatCellModel("https://cdnn21.img.ria.ru/images/07e5/07/1b/1743041536_0:0:1501:845_1920x0_80_0_0_c8da787931e6cf9ec7741177af0bb147.jpg", "Кирилл Гончаров", "Чел надо мной лучший", "10:02", 1),
    ChatCellModel("https://www.yavlinsky.ru/wp-content/uploads/2019/06/yavlinsky-nemcov-e1661081340605.jpg", "Григорий Явлинский", "Привет! Рад что все хорошо", "10:12", 4),
    ChatCellModel("https://cdnn21.img.ria.ru/images/07e5/07/1b/1743041536_0:0:1501:845_1920x0_80_0_0_c8da787931e6cf9ec7741177af0bb147.jpg", "Кирилл Гончаров", "Чел надо мной лучший", "10:02", 1),
    ChatCellModel("https://www.yavlinsky.ru/wp-content/uploads/2019/06/yavlinsky-nemcov-e1661081340605.jpg", "Григорий Явлинский", "Привет! Рад что все хорошо", "10:12", 4),
    ChatCellModel("https://cdnn21.img.ria.ru/images/07e5/07/1b/1743041536_0:0:1501:845_1920x0_80_0_0_c8da787931e6cf9ec7741177af0bb147.jpg", "Кирилл Гончаров", "Чел надо мной лучший", "10:02", 1),
    ChatCellModel("https://www.yavlinsky.ru/wp-content/uploads/2019/06/yavlinsky-nemcov-e1661081340605.jpg", "Григорий Явлинский", "Привет! Рад что все хорошо", "10:12", 4),
    ChatCellModel("https://cdnn21.img.ria.ru/images/07e5/07/1b/1743041536_0:0:1501:845_1920x0_80_0_0_c8da787931e6cf9ec7741177af0bb147.jpg", "Кирилл Гончаров", "Чел надо мной лучший", "10:02", 1),
    ChatCellModel("https://www.yavlinsky.ru/wp-content/uploads/2019/06/yavlinsky-nemcov-e1661081340605.jpg", "Григорий Явлинский", "Привет! Рад что все хорошо", "10:12", 4),
    ChatCellModel("https://cdnn21.img.ria.ru/images/07e5/07/1b/1743041536_0:0:1501:845_1920x0_80_0_0_c8da787931e6cf9ec7741177af0bb147.jpg", "Кирилл Гончаров", "Чел надо мной лучший", "10:02", 1),
    ChatCellModel("https://www.yavlinsky.ru/wp-content/uploads/2019/06/yavlinsky-nemcov-e1661081340605.jpg", "Григорий Явлинский", "Привет! Рад что все хорошо", "10:12", 4),
    ChatCellModel("https://cdnn21.img.ria.ru/images/07e5/07/1b/1743041536_0:0:1501:845_1920x0_80_0_0_c8da787931e6cf9ec7741177af0bb147.jpg", "Кирилл Гончаров", "Чел надо мной лучший", "10:02", 1),
    ChatCellModel("https://www.yavlinsky.ru/wp-content/uploads/2019/06/yavlinsky-nemcov-e1661081340605.jpg", "Григорий Явлинский", "Привет! Рад что все хорошо", "10:12", 4),
    ChatCellModel("https://cdnn21.img.ria.ru/images/07e5/07/1b/1743041536_0:0:1501:845_1920x0_80_0_0_c8da787931e6cf9ec7741177af0bb147.jpg", "Кирилл Гончаров", "Чел надо мной лучший", "10:02", 1),
    ChatCellModel("https://www.yavlinsky.ru/wp-content/uploads/2019/06/yavlinsky-nemcov-e1661081340605.jpg", "Григорий Явлинский", "Привет! Рад что все хорошо", "10:12", 4),
    ChatCellModel("https://cdnn21.img.ria.ru/images/07e5/07/1b/1743041536_0:0:1501:845_1920x0_80_0_0_c8da787931e6cf9ec7741177af0bb147.jpg", "Кирилл Гончаров", "Чел надо мной лучший", "10:02", 1),
    ChatCellModel("https://www.yavlinsky.ru/wp-content/uploads/2019/06/yavlinsky-nemcov-e1661081340605.jpg", "Григорий Явлинский", "Привет! Рад что все хорошо", "10:12", 4),
    ChatCellModel("https://cdnn21.img.ria.ru/images/07e5/07/1b/1743041536_0:0:1501:845_1920x0_80_0_0_c8da787931e6cf9ec7741177af0bb147.jpg", "Кирилл Гончаров", "Чел надо мной лучший", "10:02", 1),
    ChatCellModel("https://www.yavlinsky.ru/wp-content/uploads/2019/06/yavlinsky-nemcov-e1661081340605.jpg", "Григорий Явлинский", "Привет! Рад что все хорошо", "10:12", 4),
    ChatCellModel("https://cdnn21.img.ria.ru/images/07e5/07/1b/1743041536_0:0:1501:845_1920x0_80_0_0_c8da787931e6cf9ec7741177af0bb147.jpg", "Кирилл Гончаров", "Чел надо мной лучший", "10:02", 1),
    ChatCellModel("https://www.yavlinsky.ru/wp-content/uploads/2019/06/yavlinsky-nemcov-e1661081340605.jpg", "Григорий Явлинский", "Привет! Рад что все хорошо", "10:12", 4),
    ChatCellModel("https://cdnn21.img.ria.ru/images/07e5/07/1b/1743041536_0:0:1501:845_1920x0_80_0_0_c8da787931e6cf9ec7741177af0bb147.jpg", "Кирилл Гончаров", "Чел надо мной лучший", "10:02", 1),
    ChatCellModel("https://www.yavlinsky.ru/wp-content/uploads/2019/06/yavlinsky-nemcov-e1661081340605.jpg", "Григорий Явлинский", "Привет! Рад что все хорошо", "10:12", 4),
    ChatCellModel("https://cdnn21.img.ria.ru/images/07e5/07/1b/1743041536_0:0:1501:845_1920x0_80_0_0_c8da787931e6cf9ec7741177af0bb147.jpg", "Кирилл Гончаров", "Чел надо мной лучший", "10:02", 1),

  ];
}