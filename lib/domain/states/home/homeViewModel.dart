import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:federal_school/data/push/pushData.dart';
import 'package:federal_school/data/userDataSingltone.dart';
import 'package:federal_school/presentation/pages/home/calendar/calendarHomeView.dart';
import 'package:federal_school/presentation/pages/home/call/courseView.dart';
import 'package:federal_school/presentation/pages/home/chat/chatHomeView.dart';
import 'package:federal_school/presentation/pages/home/contact/contactView.dart';
import 'package:federal_school/presentation/pages/home/settings/settingsView.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../presentation/themes/themes.dart';
import '../../../snackBar.dart';
import '../../models/user/user.dart';

part 'homeViewModel.g.dart';

class HomeViewModel = _HomeViewModel with _$HomeViewModel;

abstract class _HomeViewModel with Store {
  @observable
  int selectedIndex = 0;

  List<Widget> screens = [
    ChatHomeView(),
    CalendarHomeView(),
    Container(),
    ContactView(),
    CourseView()
  ];

  List<String> title = [
    "Школа Яблока",
    "Календарь событий",
    "",
    "Контакты",
    "Курсы"
  ];

  List<List<Widget>?> actions = [
    null,
    [],
    null,
    null,
    []
  ];

  @observable
  UserData? userData;

  @computed
  String get role {
    return getRole(userData?.role ?? 0);
  }

  @computed
  String? get fullName{
    if (userData != null){
      if(userData?.surname == null){
        return "Неизвестный пользователь";
      }
      return "${userData?.surname} ${userData?.name} ${userData?.patronomyc}";
    }
    return "Неизвестный пользователь";
  }




  @action
  Future<void> getUserData() async {

    var s =  await AwesomeNotifications().requestPermissionToSendNotifications();
    print(s);
    userData = GlobalSingltone.getInstanse().instance;
    await PushData.setIsolateBackground();
    PushData.setIsolateForeground();
    User user = FirebaseAuth.instance.currentUser!;

    DatabaseReference ref =
        FirebaseDatabase.instance.ref("users").child(user.uid);

     ref.onValue.listen((event) {
      if(event.snapshot.exists){
        final data = Map<String, dynamic>.from(event.snapshot.value as Map);

        GlobalSingltone.getInstanse().setInstance(UserData.fromJson(data));
        userData = GlobalSingltone.getInstanse().instance;
      }
    });


    String? key = await FirebaseMessaging.instance.getToken();
    await ref.update({
      "deviceToken": key!
    });

  }

  @action
  void onDestinationSelected(int selectedIndex) {

    this.selectedIndex = selectedIndex;
  }
}
