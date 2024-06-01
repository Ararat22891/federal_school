import 'package:federal_school/presentation/Colors.dart';
import 'package:federal_school/textStyles/textStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:googleapis/calendar/v3.dart' as Calendar;
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class DialogEventViewAsset extends StatelessWidget {
  DialogEventViewAsset({required this.event});

  Calendar.Event event;

  @override
  Widget build(BuildContext context) {
    bool isLight =
        Theme.of(context).brightness == Brightness.light ? true : false;


    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color:
                            isLight ? MyColors.blue70 : MyColors.darkThemeFont),
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white),
                  ),
                ],
              ),
              Container(
                width: 12,
              ),
              Text(
                _getDateTime(event),
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              )
            ],
          ),
          Container(
            height: 8,
          ),
          Text(
            event.summary ?? "Событие",
            overflow: TextOverflow.ellipsis,
            maxLines: 5,
            style: TextStyle(
                color: isLight ? Colors.black : Colors.white,
                fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Container(
            height: 8,
          ),
          HtmlWidget(
               event.description ?? "Партийное мероприятие",
              textStyle: TextStyle(color: Colors.grey, fontSize: 16),
              onTapUrl: (url) {
                 launchUrl(Uri.parse(url));
                 return true;
              },
          )

        ],
      ),
    );
  }

  String _getDateTime(Calendar.Event event) {
    String actualDateTime = "";

    DateTime? startDate = event.start?.date;
    DateTime? startDateTime = event.start?.dateTime;
    DateTime? endDate = event.end?.date;
    DateTime? endDateTime = event.end?.dateTime;

    if (startDate == null) {
      actualDateTime = DateFormat.Hm().format(startDateTime!);
    } else if (startDateTime == null) {
      actualDateTime = "Весь день";
    }

    if (endDate == null) {
      actualDateTime += " – ${DateFormat.Hm().format(endDateTime!)}";
    }

    return actualDateTime;
  }
}
