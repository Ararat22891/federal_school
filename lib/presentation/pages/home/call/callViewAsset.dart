
import 'package:federal_school/domain/models/call/CallModel.dart';
import 'package:federal_school/domain/models/call/callType.dart';
import 'package:flutter/material.dart';

import '../../../Colors.dart';

class CallViewAsset extends StatelessWidget {

  CallModel call;

  CallViewAsset({required this.call});

  @override
  Widget build(BuildContext context) {
    var isLightTheme = Theme.of(context).brightness == Brightness.light;

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
                      foregroundImage: Image.network(call.callerImage).image,
                      backgroundImage: Image.asset("assets/bird.jpg").image,
                      radius: 30,
                    ),
                    Container(width: 12,),


                    Expanded(child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(call.callerName, style: Theme.of(context).textTheme.titleMedium),
                        Text(call.callTime.toString(), style: TextStyle(color: Colors.grey, fontSize: 12,), overflow: TextOverflow.ellipsis,),
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
}
