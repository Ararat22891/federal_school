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

  Future<void> addEvent(String summary, String description, EventDateTime start, EventDateTime? end) async{
    await init();
    final httpClient = await clientViaServiceAccount(
        credentials, [_scopeCalendar, _scopeEvents]);
    final calendarApi = CalendarApi(httpClient);

    final event = Event()
      ..summary = summary
      ..description = description
      ..start = start
      ..end = end;
    await calendarApi.events.insert(event, _calendarId);

    httpClient.close();

  }
}