import 'package:federal_school/data/calendar/googleCalendarService.dart';
import 'package:flutter/material.dart';
import 'package:googleapis/calendar/v3.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:table_calendar/table_calendar.dart';

part 'calendarHomeViewModel.g.dart';

class CalendarHomeViewModel = _CalendarHomeViewModel with _$CalendarHomeViewModel;

abstract class _CalendarHomeViewModel with Store{

  _CalendarHomeViewModel(){
    getEvents();

  }


  ScrollController controller = ScrollController();
  GoogleCalendarService _service = GoogleCalendarService();

  @observable
  Events events = Events();

  @observable
  List<Event> _thisDayEvents = [];

  @computed
  List<Event> get thisDayEvents => _thisDayEvents;

  @observable
  DateTime focusedDate = DateTime.now();

  DraggableScrollableController draggableScrollableController = DraggableScrollableController();


  final GlobalKey Key = GlobalKey();

  @observable
  double maxExtent = 0.7;

  bool isReady = false;

  @observable
  CalendarFormat calendarFormat = CalendarFormat.month;

  @action
  void onDaySelect(DateTime selecteDay, DateTime focusedDay){
    focusedDate = focusedDay;

    if(events.items != null) {
      _thisDayEvents = events.items!;
      _thisDayEvents = _thisDayEvents.where(
              (element) {
            DateTime? dateTime = element.start!.dateTime ?? element.start!.date;
            return (dateTime?.day == selecteDay.day
                && dateTime?.month == selecteDay.month
                && dateTime?.year == selecteDay.year);
          }
      ).toList();
    }
  }

  @action
  Future<void> getEvents() async{
    events = await _service.getEvents();
    print("sas"+events.items!.length.toString());
  }

  List<Event> setEvents(DateTime day) {
    _thisDayEvents.clear();


    final items = events.items;
    if (items != null) {
      String formattedDate = DateFormat("yyyy-MM-dd").format(day);
      if (items.any((element) {
        var date = DateFormat("yyyy-MM-dd").format((element.start?.dateTime) ?? (element.start?.date)!);
        if(date == formattedDate){
          _thisDayEvents.add(element);
          return true;
        }
        return false;
      })){
        return _thisDayEvents;
      }
    }
    return [];
  }

  void scroll(){
    if (draggableScrollableController.size >= maxExtent) {
      calendarFormat = CalendarFormat.week;
    } else if(draggableScrollableController.size <= maxExtent - 0.04){
      calendarFormat = CalendarFormat.month;
    }
  }


}

