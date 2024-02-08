

import 'package:federal_school/domain/models/call/callType.dart';
import 'package:federal_school/domain/models/user/user.dart';

class CallModel{
  int _callID;
  User _user;
  DateTime _callTime;
  CallType _callType;

  CallModel(this._callID, this._user, this._callTime, this._callType);

  CallType get callType => _callType;
  DateTime get callTime => _callTime;
  User get user => _user;
  int get callID => _callID;



  static List<CallModel> calls = [
    CallModel(
        0,
        User.users.first,
      DateTime(2024, 2, 1, 12, 24),
        CallType(CallKind.incoming, CallVarint.audio),
    ),

    CallModel(
      1,
      User.users[1],
      DateTime(2024, 2, 4, 21, 24),
      CallType(CallKind.outgoing, CallVarint.video),
    ),

    CallModel(
      2,
      User.users[2],
      DateTime.now(),
      CallType(CallKind.missed, CallVarint.audio),
    ),

  ];
}

