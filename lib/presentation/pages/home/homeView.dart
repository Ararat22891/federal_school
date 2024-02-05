import 'package:federal_school/domain/states/main/mainState.dart';
import 'package:federal_school/presentation/pages/home/calendar/calendarHomeView.dart';
import 'package:federal_school/presentation/widgets/GradientContainer.dart';
import 'package:federal_school/presentation/pages/home/chat/chatHomeView.dart';
import 'package:federal_school/presentation/pages/home/profile/myProfileView.dart';
import 'package:federal_school/textStyles/textStyles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Colors.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    var isLightTheme = Theme.of(context).brightness == Brightness.light;
    print(isLightTheme.toString());
    return GradientContainer(
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              title: Text(
                "Школа Яблока",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              backgroundColor: Colors.transparent,
              surfaceTintColor: Colors.transparent,
              actions: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.settings_outlined,
                      color: Colors.white,
                    )),
                IconButton(
                    onPressed: () {
                      context.read<MainState>().toggleTheme();
                    },
                    icon: Icon(
                      Icons.dark_mode_outlined,
                      color: Colors.white,
                    ))
              ],
            ),
            body: Container(
              padding: EdgeInsets.only(top: 18),
              decoration: BoxDecoration(
                  color: isLightTheme ? MyColors.white : MyColors.darkThemeContainer,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              // child: ChatHomeView(),
              child: CalendarHomeView()
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: Container(
              margin: EdgeInsets.only(top: 70),
              child: InkWell(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog.fullscreen(
                          child: MyProfileView(),
                        );
                      });
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                      radius: 34,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        foregroundImage: Image.asset("assets/2022.jpg").image,
                        backgroundImage: Image.asset("assets/bird.jpg").image,
                        radius: 30,
                      ),
                    ),
                    Text(
                      "Профиль",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: GradientContainer(
                child: NavigationBarTheme(
                  data: NavigationBarThemeData(
                      backgroundColor: Colors.transparent,
                      indicatorColor: Colors.transparent,
                      elevation: 0,
                      labelTextStyle:
                          MaterialStateProperty.resolveWith((state) {
                        if (state.contains(MaterialState.selected)) {
                          return TextStyle(color: isLightTheme ? MyColors.darkbluetext : MyColors.darkThemeSelected, fontSize: 12, fontWeight: FontWeight.bold);;
                        } else if (!state.contains(MaterialState.selected)) {
                          return TextStyles.navBarItemUnSelected;
                        }
                      })),
                  child: NavigationBar(
                    selectedIndex: 0,
                    destinations: [
                      NavigationDestination(
                          icon: Icon(
                            Icons.chat_outlined,
                            color: Colors.white,
                          ),
                          selectedIcon: Icon(
                            Icons.chat,
                            color: isLightTheme ? MyColors.darkbluetext : MyColors.darkThemeSelected,
                          ),
                          label: "Чат"),
                      NavigationDestination(
                          icon: Icon(
                            Icons.calendar_month_outlined,
                            color: Colors.white,
                          ),
                          selectedIcon: Icon(
                            Icons.calendar_month,
                            color: isLightTheme ? MyColors.darkbluetext : MyColors.darkThemeSelected,
                          ),
                          label: "Календарь"),
                      Spacer(),
                      NavigationDestination(
                          icon: Icon(
                            Icons.account_circle_outlined,
                            color: Colors.white,
                          ),
                          selectedIcon: Icon(
                            Icons.account_circle,
                            color: isLightTheme ? MyColors.darkbluetext : MyColors.darkThemeSelected,
                          ),
                          label: "Контакты"),
                      NavigationDestination(
                        icon: Icon(
                          Icons.call_outlined,
                          color: Colors.white,
                        ),
                        label: "Звонки",
                        selectedIcon: Icon(
                          Icons.call,
                          color: isLightTheme ? MyColors.darkbluetext : MyColors.darkThemeSelected,
                        ),
                      )
                    ],
                  ),
                ))));
  }
}
