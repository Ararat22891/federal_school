import 'package:federal_school/domain/states/main/mainState.dart';
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


    viewModel.draggableScrollableController.addListener(viewModel.scroll);
    print(viewModel.maxExtent);
    return Stack(
      alignment: Alignment.bottomCenter,
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
            availableCalendarFormats: {
              CalendarFormat.month: 'Month',
              CalendarFormat.week: 'Week'
            },
            startingDayOfWeek: StartingDayOfWeek.monday,
          );
        }),
        NotificationListener<DraggableScrollableNotification>(
            onNotification: (DraggableScrollableNotification DSNotification) {
          if (!viewModel.isReady) {
            when(
                (p0) =>
                    viewModel.Key.currentContext!.findRenderObject() != null,
                () {
              final RenderBox renderBox =
                  viewModel.Key.currentContext!.findRenderObject() as RenderBox;
              viewModel.maxExtent =
                  renderBox.size.height / MediaQuery.of(context).size.height +
                      0.02;
              print('Размер виджета: ${viewModel.maxExtent}');

            });
            viewModel.isReady = true;
          }
          //
          // if (DSNotification.extent >= viewModel.maxExtent) {
          //   viewModel.calendarFormat = CalendarFormat.week;
          //   return false;
          // } else if(DSNotification.extent <= viewModel.maxExtent - 0.04){
          //   viewModel.calendarFormat = CalendarFormat.month;
          //   return true;
          // }
           return false;
            },
            child: Observer(
            builder: (context) {
            return DraggableScrollableSheet(
              maxChildSize: viewModel.maxExtent,
              controller: viewModel.draggableScrollableController,
              initialChildSize: 0.3,
              minChildSize: 0.2,
              builder: (BuildContext context, scrollController) {
                return Column(
                  children: [
                    SizedBox(
                      child: Divider(
                        thickness: 5,
                      ),
                      width: 50,
                    ),
                    Expanded(
                        child: ListView.builder(
                            itemCount: 3,
                            controller: scrollController,
                            itemBuilder: (context, index) {
                              return EventViewAsset();
                            }))
                  ],
                );
              },
            );
          },
        ))
      ],
    );
  }
}
