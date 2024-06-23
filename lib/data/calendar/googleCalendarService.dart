import 'package:flutter/services.dart';
import 'package:googleapis/calendar/v3.dart';
import 'package:googleapis_auth/auth_io.dart';

class GoogleCalendarService {
  String _file = "";
  String _scopeCalendar = "";
  String _scopeEvents = "";
  static const _calendarId = 'e7f6155adbdfce99773e3afc60e98272987b367c687af04982b812028b4d09d9@group.calendar.google.com';

  late ServiceAccountCredentials credentials;

  Future<void> init() async{
    _file =  await rootBundle.loadString("assets/calendarData.json");
    credentials = ServiceAccountCredentials.fromJson(_file);
    _scopeCalendar = 'https://www.googleapis.com/auth/calendar';
    _scopeEvents = 'https://www.googleapis.com/auth/calendar.events';
  }

  Future<Events> getEvents() async{
    await init();

    final httpClient = await clientViaServiceAccount(
        credentials, [_scopeCalendar, _scopeEvents]);
    final calendarApi = CalendarApi(httpClient);
    final events = await calendarApi.events.list(_calendarId);
    httpClient.close();

    return events;
  }

  Future<void> addEvent(String summary, String description, EventDateTime start) async{
    await init();
    final httpClient = await clientViaServiceAccount(
        credentials, [_scopeCalendar, _scopeEvents]);
    final calendarApi = CalendarApi(httpClient);

    if(start.dateTime != null){
      var endTime = DateTime(start.dateTime!.year, start.dateTime!.month, start.dateTime!.day, 23,59);

      final event = Event()
        ..summary = summary
        ..description = description
        ..start = start
        ..start?.dateTime = start.dateTime
        ..end = EventDateTime(dateTime: endTime);
      ;
      await calendarApi.events.insert(event, _calendarId);
    }
    else{
      final event = Event()
        ..summary = summary
        ..description = description
        ..start = start
        ..start?.date = start.date
        ..end = start;
      ;
      await calendarApi.events.insert(event, _calendarId);
    }



    httpClient.close();

  }
}