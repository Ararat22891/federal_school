import 'package:federal_school/presentation/widgets/eventViewAsset.dart';
import 'package:federal_school/domain/states/calendar/calendarHomeViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarHomeView extends StatelessWidget {
  CalendarHomeView({super.key});

  CalendarHomeViewModel viewModel = CalendarHomeViewModel();


  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      children: [
        Observer(builder: (context) {
          return TableCalendar(
            key: viewModel.Key,
            focusedDay: viewModel.focusedDate,
            firstDay: DateTime(1999),
            onDaySelected: viewModel.onDaySelect,
            selectedDayPredicate: (day) {
              return isSameDay(viewModel.focusedDate, day);
            },
            lastDay: DateTime(2035),
            calendarStyle: CalendarStyle(
                defaultTextStyle: TextStyle(color: isDark ? Colors.white : Colors.black),
                weekendTextStyle: TextStyle(color: Colors.red)
            ),
            locale: 'ru_RU',
            calendarFormat: viewModel.calendarFormat,
            headerStyle: HeaderStyle(
                titleTextFormatter: (date, _) {
                  switch (date.month) {
                    case (1):
                      return "Январь ${date.year} г.";
                    case (2):
                      return "Февраль ${date.year} г.";
                    case (3):
                      return "Март ${date.year} г.";
                    case (4):
                      return "Апрель ${date.year} г.";
                    case (5):
                      return "Май ${date.year} г.";
                    case (6):
                      return "Июнь ${date.year} г.";
                    case (7):
                      return "Июль ${date.year} г.";
                    case (8):
                      return "Август ${date.year} г.";
                    case (9):
                      return "Сентябрь ${date.year} г.";
                    case (10):
                      return "Октябрь ${date.year} г.";
                    case (11):
                      return "Ноябрь ${date.year} г.";
                    case (12):
                      return "Декабрь ${date.year} г.";
                    default:
                      return "Месяц";
                  }
                },
                titleTextStyle: TextStyle(fontSize: 17,
                    color: isDark ? Colors.white : Colors.black
                ),
                formatButtonVisible: false),
            eventLoader: viewModel.setEvents,
            availableCalendarFormats: {
              CalendarFormat.month: 'Month',
              CalendarFormat.week: 'Week'
            },
            startingDayOfWeek: StartingDayOfWeek.monday,
          );
        }),
        Expanded(child: Observer(
          builder: (context) {
            return BottomSheet(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              elevation: 0,
              builder: (BuildContext context) {
                return Column(
                  children: [
                    SizedBox(
                      child: Divider(
                        thickness: 4,
                      ),
                      width: 50,
                    ),
                    Expanded(
                        child: Observer(
                          builder: (context){
                            print(viewModel.thisDayEvents.length);
                            if (viewModel.thisDayEvents.length != 0 ){
                              return ListView.builder(
                                  itemCount: viewModel.thisDayEvents.length,
                                  itemBuilder: (context, index) {
                                    return EventViewAsset(
                                      event: viewModel.thisDayEvents[index],
                                    );
                                  });
                            }
                            else{
                              return Center(
                                child: Text(
                                    "На этот день нет событий",
                                    style: Theme.of(context).textTheme.labelLarge,
                                ),
                              );
                            }



                          },
                        )
                    )
                  ],
                );
              }, onClosing: () {  },
            );
          },
        ))
      ],
    );
  }
}
