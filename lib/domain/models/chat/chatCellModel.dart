
class ChatCellModel{
  String _user1UID;
  String _user2UID;
  String _lastMessage;
  DateTime _sentTime;
  int _newMessagesCount;

  ChatCellModel(this._user1UID, this._user2UID, this._lastMessage, this._sentTime,
      this._newMessagesCount);

  int get newMessagesCount => _newMessagesCount;
  DateTime get sentTime => _sentTime;
  String get lastMessage => _lastMessage;
  String get user1UID => _user1UID;
  String get user2UID => _user2UID;

}