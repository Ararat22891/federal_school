import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:federal_school/data/push/pushData.dart';
import 'package:federal_school/presentation/pages/home/calendar/calendarHomeView.dart';
import 'package:federal_school/presentation/pages/home/call/callView.dart';
import 'package:federal_school/presentation/pages/home/chat/chatHomeView.dart';
import 'package:federal_school/presentation/pages/home/contact/contactView.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../presentation/themes/themes.dart';
import '../../../snackBar.dart';
import '../../models/user/user.dart';

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
  SearchAnchor(
      builder: (context, controller) {
        return IconButton(
          icon: const Icon(
            Icons.search,
            color: Colors.white,
          ),
          onPressed: () {
            controller.openView();
          },
        );
      },
      suggestionsBuilder: (context, controller) {
        return List<ListTile>.generate(5, (int index) {
          final String item = 'item $index';
          return ListTile(
            title: Text(item),
            onTap: () {
              controller.closeView(item);
            },
          );
        });
      })
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
    null
  ];

  @observable
  UserData? userData;

  @computed
  String get role {
    return getRole(userData?.role ?? 0);
  }

  @action
  Future<void> getUserData() async {
    await PushData.setIsolateForeground();
    await PushData.setIsolateBackground();
    User user = FirebaseAuth.instance.currentUser!;
    DatabaseReference ref =
        FirebaseDatabase.instance.ref("users").child(user.uid);
    ref.onValue.listen((event) async {
      var snapshot = event.snapshot;
      if (snapshot.exists) {
        print(snapshot.value);
        snapshot.value;
        final data = Map<String, dynamic>.from(snapshot.value as Map);
        userData = UserData.fromJson(data);
        String? key = await FirebaseMessaging.instance.getToken();

        ref.update({
          "deviceToken": key!
        });

        if (!userData!.isEnable) {
          SnackbarGlobal.show("Ваш аккаунт заблокирован!");
        }

      }
    });

  }

  @action
  void onDestinationSelected(int selectedIndex) {
    this.selectedIndex = selectedIndex;
  }
}
