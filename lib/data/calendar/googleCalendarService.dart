import 'package:flutter/services.dart';
import 'package:googleapis/calendar/v3.dart' as calendar;
import 'package:googleapis_auth/auth_io.dart' as auth;

class GoogleCalendarService {

  Future<calendar.Events> getEvents() async{
    String file =  await rootBundle.loadString("assets/calendarData.json");
    final credentials = auth.ServiceAccountCredentials.fromJson(file);
    const scopeCalendar = 'https://www.googleapis.com/auth/calendar'; // authorization scopes
    const scopeEvents = 'https://www.googleapis.com/auth/calendar.events';


    // Создание клиента
    final httpClient = await auth.clientViaServiceAccount(
        credentials, [scopeCalendar, scopeEvents]);

    // Создание объекта для работы с API
    final calendarApi = calendar.CalendarApi(httpClient);

    // ID общедоступного календаря Google
    const calendarId = 'e7f6155adbdfce99773e3afc60e98272987b367c687af04982b812028b4d09d9@group.calendar.google.com';

    // Запрос на получение событий
    final events = await calendarApi.events.list(calendarId);

    // Закрытие клиента
    httpClient.close();
    return events;
  }
}