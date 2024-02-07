import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:federal_school/presentation/pages/home/calendar/calendarHomeView.dart';
import 'package:federal_school/presentation/pages/home/call/callView.dart';
import 'package:federal_school/presentation/pages/home/chat/chatHomeView.dart';
import 'package:federal_school/presentation/pages/home/contact/contactView.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../presentation/themes/themes.dart';

part 'homeViewModel.g.dart';

class HomeViewModel = _HomeViewModel with _$HomeViewModel;

List<Widget> chatActions = [
  IconButton(
      onPressed: () {},
      icon: Icon(
        Icons.settings_outlined,
        color: Colors.white,
      )),
  ThemeSwitcher.withTheme(
    builder: (context, switcher, theme) {
      return IconButton(
          onPressed: () {
            switcher.changeTheme(
                theme: theme.brightness == Brightness.light
                    ? darkTheme()
                    : lightTheme(),
                isReversed:
                    theme.brightness == Brightness.light ? false : true);
          },
          icon: Icon(
            theme.brightness == Brightness.light
                ? Icons.dark_mode_outlined
                : Icons.light_mode_outlined,
            color: Colors.white,
          ));
    },
  ),
];

List<Widget> contactsActions = [
  IconButton(
      onPressed: () {},
      icon: Icon(
        Icons.search,
        color: Colors.white,
      )),
];

abstract class _HomeViewModel with Store {
  @observable
  int selectedIndex = 0;

  List<Widget> screens = [
    ChatHomeView(),
    CalendarHomeView(),
    Container(),
    ContactView(),
    CallView()
  ];

  List<String> title = [
    "Школа Яблока",
    "Календарь событий",
    "",
    "Контакты",
    "Звонки"
  ];

  List<List<Widget>?> actions = [
    chatActions,
    null,
    null,
    contactsActions,
    contactsActions
  ];

  @action
  void onDestinationSelected(int selectedIndex) {
    this.selectedIndex = selectedIndex;
  }
}
