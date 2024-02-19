
import 'package:federal_school/domain/models/user/user.dart';
import 'package:flutter/material.dart';

enum CallStatus {calling, accepted, ringing}

class AcceptDeclineCallView extends StatefulWidget {
  final UserData user;
  final CallStatus? callStatus;
  final String? roomId;

   AcceptDeclineCallView({
    Key? key,
    required this.user,
    this.callStatus,
    this.roomId
  }): super(key: key);

  @override
  State<AcceptDeclineCallView> createState() => _AcceptDeclineCallViewState();
}

class _AcceptDeclineCallViewState extends State<AcceptDeclineCallView> {

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
