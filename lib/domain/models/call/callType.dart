
enum CallKind{missed, incoming, outgoing}
enum CallVarint{audio, video}


class CallType{
  CallKind _callKind;
  CallVarint _callVarint;

  CallType(this._callKind, this._callVarint);

  CallVarint get callVarint => _callVarint;
  CallKind get callKind => _callKind;
}