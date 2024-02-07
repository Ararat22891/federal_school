

import 'package:federal_school/domain/models/call/callType.dart';

class CallModel{
  int _callID;
  String _callerImage;
  String _callerName;
  DateTime _callTime;
  CallType _callType;

  CallModel(this._callID, this._callerImage, this._callerName, this._callTime, this._callType);

  CallType get callType => _callType;
  DateTime get callTime => _callTime;
  String get callerImage => _callerImage;
  int get callID => _callID;
  String get callerName => _callerName;



  static List<CallModel> calls = [
    CallModel(
        0,
        "https://cdn-media.tass.ru/width/1020_b9261fa1/tass/m2/uploads/i/20190927/5182903.jpg",
        "Лионель Месси",
        DateTime(2024, 12, 12),
        CallType(CallKind.incoming, CallVarint.audio),
    ),

    CallModel(
      1,
      "https://cdn-media.tass.ru/width/1020_b9261fa1/tass/m2/uploads/i/20190927/5182903.jpg",
      "Лионель Месси",
      DateTime(2024, 12, 12),
      CallType(CallKind.incoming, CallVarint.video),
    ),

  ];
}

