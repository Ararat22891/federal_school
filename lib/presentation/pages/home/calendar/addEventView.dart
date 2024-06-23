
import 'package:federal_school/domain/states/calendar/addEventViewModel.dart';
import 'package:federal_school/domain/states/calendar/calendarHomeViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';

class AddEventView extends StatefulWidget {

  DateTime? selectedDay;
  CalendarHomeViewModel calendarHomeViewModel;
  AddEventView({required this.selectedDay, required this.calendarHomeViewModel});


  @override
  State<AddEventView> createState() => _AddEventViewState();
}

class _AddEventViewState extends State<AddEventView> {
  late AddEventViewModel eventViewModel;

  @override
  void initState() {
    eventViewModel = AddEventViewModel();
    eventViewModel.selectedDate = widget.selectedDay;


    eventViewModel.descriptionController = TextEditingController();
    eventViewModel.nameCourseController = TextEditingController();


    eventViewModel.dateController =     TextEditingController(text: eventViewModel.selectedDateString ?? "");;
    super.initState();
  }

  @override
  void dispose() {
    eventViewModel.descriptionController.dispose();
    eventViewModel.nameCourseController.dispose();

    var selected = null;
    var time = selected == null ? "" : DateFormat.yMMMMd("ru_RU").format(selected);
    eventViewModel.selectedDate = selected;
    eventViewModel.dateController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Dialog(
        insetPadding: EdgeInsets.all(20),
        child: Observer(
          builder: (context){
            return Padding(
                padding: EdgeInsets.all(20),
                child: !eventViewModel.isLoadingData ?
                Form(
                  key: eventViewModel.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("Добавление события", style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 26),),
                      Container(height: 20,),



                      TextFormField(
                        style: Theme.of(context).textTheme.labelLarge,
                        validator: eventViewModel.validate,
                        controller: eventViewModel.nameCourseController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.text_snippet),
                          hintText: "Название события",
                        ),
                      ),

                      Container(height: 12,),
                      TextFormField(
                        style: Theme.of(context).textTheme.labelLarge,
                        validator: eventViewModel.validate,
                        controller: eventViewModel.descriptionController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.abc),
                          hintText: "Описание события",
                        ),
                      ),



                      Container(height: 12,),


                      TextFormField(
                        style: Theme.of(context).textTheme.labelLarge,
                        validator: eventViewModel.validate,
                        onTap: () async{
                          eventViewModel.selectedDate = await showDatePicker(
                              context: context,
                              firstDate: DateTime(2015),
                              lastDate: DateTime(2050)
                          );
                          eventViewModel.time = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay(hour: 00, minute: 00)
                          );


                          eventViewModel.dateController.text = eventViewModel.selectedDateString!;

                        },
                        readOnly: true,
                        controller: eventViewModel.dateController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.calendar_month),
                          hintText: "Дата события",

                        ),
                      ),




                      Container(height: 20,),
                      Container(
                        width: double.infinity,
                        child: FilledButton.icon(
                          onPressed: () async{
                            if(eventViewModel.formKey.currentState!.validate()){
                              await eventViewModel.addEvent();
                              Navigator.of(context).pop();
                              await widget.calendarHomeViewModel.getEvents();
                            }
                          },
                          icon: Icon(Icons.event),
                          label: Text("Добавить событие"),
                          style: FilledButton.styleFrom(backgroundColor: Colors.green[800]),
                        ),
                      )





                    ],
                  ),
                ) :
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                      CircularProgressIndicator(),
                  ],
                )
            );
          },
        )
    );
  }
}
