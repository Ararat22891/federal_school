import 'package:federal_school/presentation/pages/home/calendar/addEventView.dart';
import 'package:federal_school/presentation/widgets/DefaultButton.dart';
import 'package:federal_school/presentation/widgets/eventViewAsset.dart';
import 'package:federal_school/domain/states/calendar/calendarHomeViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarHomeView extends StatefulWidget {
  CalendarHomeView({super.key});

  @override
  State<CalendarHomeView> createState() => _CalendarHomeViewState();
}

class _CalendarHomeViewState extends State<CalendarHomeView> {
  CalendarHomeViewModel viewModel = CalendarHomeViewModel();

  @override
  void initState() {
    viewModel.getEvents();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      children: [
        Observer(builder: (context) {
          viewModel.allEvents;
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
        Expanded(
            child: BottomSheet(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              elevation: 0,
              enableDrag: false,
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
                              return CustomScrollView(
                                slivers: [
                                  viewModel.userData!.role == 3 ?  SliverAppBar(
                                    backgroundColor: Colors.transparent,
                                    title: DefaultButton(
                                      onPressed: (){
                                        showDialog(context: context, builder: (context) => AddEventView(
                                          selectedDay: viewModel.focusedDate,
                                          calendarHomeViewModel: viewModel,
                                        ));
                                      },
                                      text: "Добавить событие",
                                    ),
                                    titleSpacing: 0,
                                    pinned: false,
                                    floating: true,
                                  ) : SliverToBoxAdapter(),
                                  SliverList.builder(
                                      itemCount: viewModel.thisDayEvents.length,
                                      itemBuilder: (context, index) {
                                        return EventViewAsset(
                                          event: viewModel.thisDayEvents[index],
                                        );
                                      }
                                  ),
                                ],
                              );
                            }
                            else{
                              return CustomScrollView(
                                slivers: [
                                  viewModel.userData!.role == 3 ?  SliverAppBar(
                                    backgroundColor: Colors.transparent,
                                    title: DefaultButton(
                                      onPressed: (){
                                        showDialog(context: context, builder: (context) => AddEventView(
                                          selectedDay: viewModel.focusedDate,
                                          calendarHomeViewModel: viewModel,
                                        ));
                                      },
                                      text: "Добавить событие",
                                    ),
                                    titleSpacing: 0,
                                    pinned: false,
                                    floating: true,
                                  ) : SliverToBoxAdapter(),
                                  SliverFillRemaining(
                                    child: Center(
                                      child: Text(
                                        "На этот день нет событий",
                                        style: Theme.of(context).textTheme.labelLarge,
                                      ),
                                    ),
                                  )
                                ],
                              );
                            }
                          },
                        )
                    )
                  ],
                );
              }, onClosing: () {  },
            )
        )
      ],
    );
  }
}
