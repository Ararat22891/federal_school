
import 'package:federal_school/domain/models/call/CallModel.dart';
import 'package:federal_school/domain/models/call/callType.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../Colors.dart';

class CallViewAsset extends StatelessWidget {

  CallModel call;

  CallViewAsset({required this.call});

  @override
  Widget build(BuildContext context) {
    var isLightTheme = Theme.of(context).brightness == Brightness.light;
    String fullName = "${call.user.surname} ${call.user.name}";
    String date = formatMessageDate(call.callTime);

    CallKind callKind = call.callType.callKind;

    return Material(
        color: Colors.transparent,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 6),
          child: InkWell(
              onTap: (){},
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 14),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      foregroundImage: Image.network(call.user.photoPath).image,
                      backgroundImage: Image.asset("assets/bird.jpg").image,
                      radius: 30,
                    ),
                    Container(width: 12,),


                    Expanded(child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(fullName, style: Theme.of(context).textTheme.titleMedium),
                        Row(
                          children: [
                            if (callKind == CallKind.incoming) Icon(Icons.call_received, color: Colors.green,),
                            if (callKind == CallKind.outgoing) Icon(Icons.call_made_outlined, color: Colors.blue,),
                            if (callKind == CallKind.missed) Icon(Icons.call_missed_outgoing, color: Colors.red,),
                            Text(date, style: TextStyle(color: Colors.grey, fontSize: 12,), overflow: TextOverflow.ellipsis,),
                          ],
                        )
                      ],
                    ),),


                    IconButton(
                        onPressed: (){},
                        icon:
                        Icon(
                          call.callType.callVarint == CallVarint.audio ?  Icons.phone : Icons.videocam,
                          color: isLightTheme ? MyColors.darkbluetext : MyColors.darkThemeFont,
                        )
                    ),

                  ],
                ),
              )
          ),
        )
    );
  }


  String formatMessageDate(DateTime messageDateTime) {
    DateTime now = DateTime.now();
    Duration difference = now.difference(messageDateTime);
    String dayOfWeek = DateFormat.EEEE('ru').format(messageDateTime);
    if (difference.inDays == 0) {
      // Сообщение отправлено сегодня
      return " Сегодня, ${DateFormat.Hm('ru').format(messageDateTime)}";

    } else if (difference.inDays < 7) {
      return " ${dayOfWeek}, ${DateFormat.Hm('ru').format(messageDateTime)}";
    } else if (difference.inDays < 365){
      return DateFormat.MMMd('ru').format(messageDateTime); // День и месяц
    }
    else {
      // Сообщение отправлено ранее
      return DateFormat.yMMMd('ru').format(messageDateTime); // День и месяц
    }
  }

}
