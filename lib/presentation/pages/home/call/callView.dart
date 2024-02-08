

import 'package:federal_school/domain/models/call/CallModel.dart';
import 'package:federal_school/presentation/pages/home/call/callViewAsset.dart';
import 'package:flutter/material.dart';

class CallView extends StatelessWidget {
  const CallView({super.key});

  @override
  Widget build(BuildContext context) {
    CallModel.calls.sort((a,b) => b.callTime.compareTo(a.callTime));
    return  ListView.builder(
      itemCount: CallModel.calls.length,
        itemBuilder: (context, index){
          return CallViewAsset(call: CallModel.calls[index]);
        }
    );
  }
}
