import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:federal_school/domain/states/home/homeViewModel.dart';
import 'package:federal_school/presentation/pages/blocked/blockedView.dart';
import 'package:federal_school/presentation/pages/home/call/addCourse/addCourseView.dart';
import 'package:federal_school/presentation/pages/home/settings/settingsView.dart';
import 'package:federal_school/presentation/widgets/GradientContainer.dart';
import 'package:federal_school/presentation/pages/home/profile/profileView.dart';
import 'package:federal_school/presentation/widgets/MyCircleAvatar.dart';
import 'package:federal_school/presentation/widgets/roundedContainer.dart';
import 'package:federal_school/textStyles/textStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../data/userDataSingltone.dart';
import '../../Colors.dart';
import '../../themes/themes.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeViewModel homeViewModel = HomeViewModel();

  @override
  void initState() {
    super.initState();
    homeViewModel.getUserData();
    if (GlobalSingltone.getInstanse().instance?.role == 2) {
      homeViewModel.actions[4]!.add(IconButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return AddCourseView();
                });
          },
          icon: Icon(
            Icons.add,
            color: Colors.white,
          )));
    }
  }

  @override
  Widget build(BuildContext context) {
    var isLightTheme =
        Theme.of(context).brightness == Brightness.light ? true : false;

    List<Widget> chatActions = [
      IconButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (BuildContext context) {
              return SettingsView();
            }));
          },
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

    return Observer(builder: (context) {
      if (homeViewModel.userData != null) {
        if (!homeViewModel.userData!.isEnable) {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) {
            return BlockedView();
          }), (route) => false);
        }
      }

      return ThemeSwitchingArea(
          child: GradientContainer(
              child: Scaffold(
                  resizeToAvoidBottomInset: false,
                  backgroundColor: Colors.transparent,
                  appBar: PreferredSize(
                      preferredSize: Size(double.infinity, kToolbarHeight),
                      child: AppBar(
                          title: Observer(builder: (context) {
                            return Text(
                              homeViewModel.title[homeViewModel.selectedIndex],
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            );
                          }),
                          backgroundColor: Colors.transparent,
                          surfaceTintColor: Colors.transparent,
                          centerTitle: false,
                          actions: homeViewModel.selectedIndex == 0
                              ? chatActions
                              : homeViewModel
                                  .actions[homeViewModel.selectedIndex])),
                  body: RoundedContainer(
                      child:
                          homeViewModel.screens[homeViewModel.selectedIndex]),
                  floatingActionButtonLocation:
                      FloatingActionButtonLocation.miniCenterDocked,
                  floatingActionButton: Container(
                    margin: EdgeInsets.only(top: 70),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return MyProfileView(viewModel: homeViewModel);
                        }));
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CircleAvatar(
                              radius: 34,
                              backgroundColor: Colors.white,
                              child: Observer(builder: (context) {
                                return MyCircleAvatar(
                                  networkAsset:
                                      homeViewModel.userData?.photoPath,
                                  radius: 30,
                                );
                              })),
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
                          child: NavigationBar(
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
                              Container(),
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
                                  Icons.library_books_outlined,
                                  color: Colors.white,
                                ),
                                label: "Курсы",
                                selectedIcon: Icon(
                                  Icons.library_books,
                                  color: isLightTheme
                                      ? MyColors.darkbluetext
                                      : MyColors.darkThemeSelected,
                                ),
                              )
                            ],
                          ))))));
    });
  }
}
