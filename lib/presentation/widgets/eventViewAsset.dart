
import 'package:federal_school/presentation/Colors.dart';
import 'package:federal_school/textStyles/textStyles.dart';
import 'package:flutter/material.dart';
import 'package:googleapis/calendar/v3.dart' as Calendar;
import 'package:intl/intl.dart';

class EventViewAsset extends StatelessWidget {
   EventViewAsset({required this.event});

   Calendar.Event event;

  @override
  Widget build(BuildContext context) {
    bool isLight = Theme.of(context).brightness == Brightness.light ? true : false;

    return Card(
      surfaceTintColor: isLight? MyColors.white : MyColors.darkThemeMain,
        shadowColor: isLight? MyColors.white : MyColors.darkThemeMain,
        color: isLight? MyColors.white : MyColors.darkThemeMain,
        elevation: 12,
        child: Container(
          padding: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: isLight ? MyColors.blue70 : MyColors.darkThemeFont
                        ),
                      ),

                      Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white
                        ),
                      ),
                    ],
                  ),
                  Container(width: 12,),
                  Text(_getDateTime(event), style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 14),)
                ],
              ),
              Container(height: 8,),
              Text(event.summary ?? "Событие", overflow: TextOverflow.ellipsis, maxLines: 1, style: TextStyle(color: isLight ? Colors.black : Colors.white, fontWeight: FontWeight.bold),),
              Container(height: 8,),
              Text(event.description ?? "Партийное мероприятие", style: TextStyle(color: Colors.grey,))
            ],
          ),
        )
      );
  }



   String _getDateTime(Calendar.Event event){
     String actualDateTime = "";

     DateTime? startDate = event.start?.date;
     DateTime? startDateTime = event.start?.dateTime;
     DateTime? endDate = event.end?.date;
     DateTime? endDateTime = event.end?.dateTime;

     if (startDate == null){
       actualDateTime = DateFormat.Hm().format(startDateTime!);
     }
     else if (startDateTime == null){
       actualDateTime = "Весь день";
     }

     if(endDate == null){
       actualDateTime += " – ${DateFormat.Hm().format(endDateTime!)}";
     }

     return actualDateTime;
   }
}
