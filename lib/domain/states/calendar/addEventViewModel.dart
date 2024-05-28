
import 'package:federal_school/data/calendar/googleCalendarService.dart';
import 'package:federal_school/domain/states/calendar/calendarHomeViewModel.dart';
import 'package:flutter/material.dart';
import 'package:googleapis/calendar/v3.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';

part 'addEventViewModel.g.dart';

class AddEventViewModel = _AddEventViewModel with _$AddEventViewModel;

abstract class _AddEventViewModel with Store{

  final formKey = GlobalKey<FormState>();

  @observable
  bool isLoadingData = false;

  late TextEditingController  nameCourseController, descriptionController,  dateController;


  @observable
  DateTime? selectedDate;

  @observable
  TimeOfDay? time;


  String? get selectedDateString{

    if(selectedDate == null){
      return null;
    }
    var date = DateFormat.yMd("ru_RU").format(selectedDate!);
    var text = "${date}";
    if(time != null){
      selectedDate!.add(Duration(
        hours: time!.hour,
        minutes: time!.minute
      ));
      text += " в ${time!.hour}: ${time!.minute}";
    }

    return text;
  }




  @action
  Future<void> addEvent() async{
    isLoadingData = true;
    GoogleCalendarService service = GoogleCalendarService();

    var start = EventDateTime(dateTime: selectedDate);

    await service.addEvent(
        nameCourseController.text,
        descriptionController.text,
        start,
        start
    );
    isLoadingData = false;

  }

  @action
  String? validate (String? text){
    if(text!.trim().isEmpty){
      return "Введите данные";
    }

  }


}