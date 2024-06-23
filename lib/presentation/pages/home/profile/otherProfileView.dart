import 'package:federal_school/data/push/pushData.dart';
import 'package:federal_school/data/userDataSingltone.dart';
import 'package:federal_school/main.dart';
import 'package:federal_school/presentation/pages/call/callView.dart';
import 'package:federal_school/presentation/pages/home/dialog/dialogView.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../data/notifications/sendNotification.dart';
import '../../../../domain/models/user/user.dart';
import '../../../Colors.dart';
import '../../../widgets/GradientContainer.dart';

class OtherProfileView extends StatelessWidget {
  UserData userData;

  OtherProfileView(this.userData);

  int _role = GlobalSingltone.getInstanse().instance!.role!;


  @override
  Widget build(BuildContext context) {
    var isLightTheme =
        Theme.of(context).brightness == Brightness.light ? true : false;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Material(
              color:
                  isLightTheme ? MyColors.white : MyColors.darkThemeContainer,
              child: GradientContainer(
                boxRadius: BorderRadius.only(
                    bottomRight: Radius.circular(25),
                    bottomLeft: Radius.circular(25)),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    AppBar(
                      backgroundColor: Colors.transparent,
                      centerTitle: true,
                      foregroundColor: Colors.white,
                      title: Text(
                        "Профиль",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Spacer(),
                    FittedBox(
                      child: CircleAvatar(
                        backgroundImage: (userData.photoPath ?? "").isNotEmpty
                            ? Image.network(userData.photoPath!).image
                            : Image.asset("assets/bird.jpg").image,
                        maxRadius: MediaQuery.of(context).size.height / 6.5,
                      ),
                    ),
                    Spacer(),
                    Spacer()
                  ],
                ),
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Container(
              color:
                  isLightTheme ? MyColors.white : MyColors.darkThemeContainer,
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 40,
                  ),
                  Text(
                    "ФИО",
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  Observer(
                    builder: (context) => TextFormField(
                      initialValue: userData.name ?? "Неизвестный пользователь",
                      style: Theme.of(context).textTheme.titleMedium,
                      readOnly: true,
                      enabled: false,
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(horizontal: 6),
                      ),
                    ),
                  ),
                  Container(
                    height: 12,
                  ),
                  Text(
                    "Номер телефона",
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  telNumber(_role, userData.role!, userData.telNumber, context),
                  Container(
                    height: 12,
                  ),
                  Text(
                    "Статус",
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  TextFormField(
                    initialValue: getRole(userData.role!),
                    style: Theme.of(context).textTheme.titleMedium,
                    enabled: false,
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.symmetric(horizontal: 6),
                    ),
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton.filled(
                        onPressed: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return DialogView(userData);
                          }));
                        },
                        icon: Icon(Icons.chat),
                        style: IconButton.styleFrom(
                            padding: EdgeInsets.all(10),
                            backgroundColor: isLightTheme
                                ? MyColors.grey
                                : MyColors.darkThemeSecondary,
                            foregroundColor: isLightTheme
                                ? MyColors.darkbluetext
                                : MyColors.darkThemeFont),
                      ),
                      IconButton.filled(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return videoCall(userData);
                          }));
                        },
                        icon: Icon(Icons.videocam_sharp),
                        style: IconButton.styleFrom(
                            padding: EdgeInsets.all(10),
                            backgroundColor: isLightTheme
                                ? MyColors.grey
                                : MyColors.darkThemeSecondary,
                            foregroundColor: isLightTheme
                                ? MyColors.darkbluetext
                                : MyColors.darkThemeFont),
                      ),
                    ],
                  ),
                  Container(
                    height: 30,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}


Widget telNumber(int myRole, int OtherRole, String telNumber, BuildContext context) {
  if (myRole == 1 && OtherRole == 1)
    return TextFormField(
      initialValue: telNumber,
      style: Theme.of(context).textTheme.titleMedium,
      enabled: false,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 6),
      ),
    );
  else if (myRole == 2 && (OtherRole == 1 || OtherRole == 2))
    return TextFormField(
      initialValue: telNumber,
      style: Theme.of(context).textTheme.titleMedium,
      enabled: false,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 6),
      ),
    );
  else if (myRole == 3 &&
      (OtherRole== 1 || OtherRole == 2 || OtherRole == 3))
    return TextFormField(
      initialValue: telNumber,
      style: Theme.of(context).textTheme.titleMedium,
      enabled: false,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 6),
      ),
    );
  else{
    String text = "Номер телефона скрыт";
    return TextFormField(
      initialValue: text,
      style: Theme.of(context).textTheme.titleMedium!.copyWith(fontStyle: FontStyle.italic, color: Colors.grey),
      enabled: false,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 6),
      ),
    );
  }
}


Widget videoCall(UserData userData) {
  String s = generateRandomString(12);
  User user = FirebaseAuth.instance.currentUser!;

  String? userInfo = user.displayName;
  String name = userInfo ?? "Неизвестный пользователь";
  var data = {"type": "Звонок", "call_id": s, "callerName": name};
  send(userData.deviceToken, data);
  return CallingView(channelName: s);
}
