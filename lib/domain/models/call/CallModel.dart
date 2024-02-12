

import 'package:federal_school/domain/models/call/callType.dart';
import 'package:federal_school/domain/models/user/user.dart';

class CallModel{
  int _callID;
  UserData _user;
  DateTime _callTime;
  CallType _callType;

  CallModel(this._callID, this._user, this._callTime, this._callType);

  CallType get callType => _callType;
  DateTime get callTime => _callTime;
  UserData get user => _user;
  int get callID => _callID;



  static List<CallModel> calls = [
    CallModel(
        0,
        UserData.users.first,
      DateTime(2024, 2, 1, 12, 24),
        CallType(CallKind.incoming, CallVarint.audio),
    ),

    CallModel(
      1,
      UserData.users[1],
      DateTime(2024, 2, 4, 21, 24),
      CallType(CallKind.outgoing, CallVarint.video),
    ),

    CallModel(
      2,
      UserData.users[2],
      DateTime.now(),
      CallType(CallKind.missed, CallVarint.audio),
    ),

  ];
}

