import 'package:federal_school/data/calendar/googleCalendarService.dart';
import 'package:federal_school/data/userDataSingltone.dart';
import 'package:flutter/material.dart';
import 'package:googleapis/calendar/v3.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../models/user/user.dart';

part 'calendarHomeViewModel.g.dart';

class CalendarHomeViewModel = _CalendarHomeViewModel with _$CalendarHomeViewModel;

abstract class _CalendarHomeViewModel with Store{

  _CalendarHomeViewModel(){
    getEvents();
  }


  ScrollController controller = ScrollController();
  UserData? userData = GlobalSingltone.getInstanse().instance;
  GoogleCalendarService _service = GoogleCalendarService();

  @observable
  Events events = Events();

  @observable
  ObservableList<Event?>? allEvents = ObservableList();

  @observable
  ObservableList<Event> _thisDayEvents = ObservableList();

  @observable
  ObservableList<Event> _sets = ObservableList();


  @computed
  ObservableList<Event> get thisDayEvents => _thisDayEvents;

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
   _thisDayEvents.clear();

    final items = events.items;
    if (items != null) {
      if (items.any((element) {
        _thisDayEvents = events.items!.asObservable();
        _thisDayEvents = events.items!.where(
                (element) {
              DateTime? dateTime = element.start!.dateTime ?? element.start!.date;
              return (dateTime?.day == selecteDay.day
                  && dateTime?.month == selecteDay.month
                  && dateTime?.year == selecteDay.year);
            }
        ).toList().asObservable();
        return true;
      })){
      }
    }
  }

  @action
  Future<void> getEvents() async{
    isReady = false;
    events = await _service.getEvents();
    isReady = true;
    var s = events.items;
    allEvents = s?.toList().asObservable();

  }

  List<Event> setEvents(DateTime day) {
    _sets.clear();
    final items = events.items;
    if (items != null) {
      if (items.any((element) {
        _sets = events.items!.asObservable();
        _sets = events.items!.where(
                (element) {
              DateTime? dateTime = element.start!.dateTime ?? element.start!.date;
              return (dateTime?.day == day.day
                  && dateTime?.month == day.month
                  && dateTime?.year == day.year);
            }
        ).toList().asObservable();
        return true;
      })){
        return _sets;
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

