import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:federal_school/domain/states/home/homeViewModel.dart';
import 'package:federal_school/presentation/themes/themes.dart';
import 'package:federal_school/presentation/widgets/GradientContainer.dart';
import 'package:federal_school/presentation/pages/home/profile/myProfileView.dart';
import 'package:federal_school/textStyles/textStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../Colors.dart';

class HomeView extends StatelessWidget {
  HomeViewModel homeViewModel = HomeViewModel();

  @override
  Widget build(BuildContext context) {
    var isLightTheme =
        Theme.of(context).brightness == Brightness.light ? true : false;
    return ThemeSwitchingArea(
        child: GradientContainer(
            child: Scaffold(
                backgroundColor: Colors.transparent,
                appBar: PreferredSize(
                    preferredSize: Size(double.infinity, kToolbarHeight),
                    child: Observer(
                      builder: (context){
                        return AppBar(
                            title: Observer(
                                builder: (context){
                                  return Text(
                                    homeViewModel.title[homeViewModel.selectedIndex],
                                    style: TextStyle(
                                        color: Colors.white, fontWeight: FontWeight.bold),
                                  );
                                }
                            ),
                            backgroundColor: Colors.transparent,
                            surfaceTintColor: Colors.transparent,
                            centerTitle: false,
                            actions: homeViewModel.actions[homeViewModel.selectedIndex]
                        );
                      },
                    )
                ),
                body: Container(
                  padding: EdgeInsets.only(top: 18),
                  decoration: BoxDecoration(
                      color: isLightTheme
                          ? MyColors.white
                          : MyColors.darkThemeContainer,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  // child: ChatHomeView(),
                  child: Observer(builder: (context) {
                    return homeViewModel.screens[homeViewModel.selectedIndex];
                  }),
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
                            foregroundImage:
                                Image.asset("assets/2022.jpg").image,
                            backgroundImage:
                                Image.asset("assets/bird.jpg").image,
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
                                return TextStyle(
                                    color: isLightTheme
                                        ? MyColors.darkbluetext
                                        : MyColors.darkThemeSelected,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold);
                                ;
                              } else if (!state
                                  .contains(MaterialState.selected)) {
                                return TextStyles.navBarItemUnSelected;
                              }
                            })),
                        child: Observer(builder: (context) {
                          return NavigationBar(
                            selectedIndex: homeViewModel.selectedIndex,
                            onDestinationSelected:
                                homeViewModel.onDestinationSelected,
                            destinations: [
                              NavigationDestination(
                                  icon: Icon(
                                    Icons.chat_outlined,
                                    color: Colors.white,
                                  ),
                                  selectedIcon: Icon(
                                    Icons.chat,
                                    color: isLightTheme
                                        ? MyColors.darkbluetext
                                        : MyColors.darkThemeSelected,
                                  ),
                                  label: "Чат"),
                              NavigationDestination(
                                  icon: Icon(
                                    Icons.calendar_month_outlined,
                                    color: Colors.white,
                                  ),
                                  selectedIcon: Icon(
                                    Icons.calendar_month,
                                    color: isLightTheme
                                        ? MyColors.darkbluetext
                                        : MyColors.darkThemeSelected,
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
                                    color: isLightTheme
                                        ? MyColors.darkbluetext
                                        : MyColors.darkThemeSelected,
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
                                  color: isLightTheme
                                      ? MyColors.darkbluetext
                                      : MyColors.darkThemeSelected,
                                ),
                              )
                            ],
                          );
                        }))))));
  }
}
