import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:table_calendar/table_calendar.dart';
part 'calendarHomeViewModel.g.dart';


class CalendarHomeViewModel = _CalendarHomeViewModel with _$CalendarHomeViewModel;

abstract class _CalendarHomeViewModel with Store{

  @observable
  ScrollController controller = ScrollController();

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
  }


}

