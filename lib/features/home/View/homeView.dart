
import 'package:federal_school/features/ChatHome/View/chatHomeView.dart';
import 'package:federal_school/features/login/View/loginView.dart';
import 'package:federal_school/features/myProfile/View/myProfileView.dart';
import 'package:federal_school/textStyles/textStyles.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../../Colors.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.height);
    return Container(
      decoration: BoxDecoration(
        gradient:  LinearGradient(
          colors: [
            MyColors.blue70,
            MyColors.beige
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text("Школа Яблока", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
          backgroundColor: Colors.transparent,
          centerTitle: false,
          actions: [
            IconButton(
                onPressed: (){},
                icon: Icon(Icons.settings_outlined, color: Colors.white,)
            ),

            IconButton(
                onPressed: (){},
                icon: Icon(Icons.dark_mode_outlined, color: Colors.white,)
            )
          ],
        ),

        body: Container(
            padding: EdgeInsets.only(top: 18),
            decoration: BoxDecoration(
                color: MyColors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))
            ),
          child: ChatHomeView(),
        ),

        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton:  Container(
          margin: EdgeInsets.only(top: 70),
          child: InkWell(
            onTap: (){
              showDialog(
                  context: context,
                  builder: (context){
                    return Dialog.fullscreen(
                      child: MyProfileView(),
                    );
                  }
              );
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
                Text("Профиль", style: TextStyle(color: Colors.white),),
              ],

            ),
          ),
        ),
        bottomNavigationBar: Container(

          decoration: BoxDecoration(
            gradient:  LinearGradient(
              colors: [
                MyColors.blue70,
                MyColors.beige
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
          child: NavigationBarTheme(
            data: NavigationBarThemeData(
              backgroundColor: Colors.transparent,
              indicatorColor: Colors.transparent,
              elevation: 0,
              labelTextStyle: MaterialStateProperty.resolveWith(
                  (state){

                    if(state.contains(MaterialState.selected)){
                      return TextStyles.navBarItemSelected;
                    }
                    else if (!state.contains(MaterialState.selected)){
                      return TextStyles.navBarItemUnSelected;
                    }
                  }
              )
            ),
            child:  NavigationBar(
              selectedIndex: 0,
              destinations: [
                NavigationDestination(
                    icon: Icon(Icons.chat_outlined, color: Colors.white,),
                    selectedIcon: Icon(Icons.chat,  color: MyColors.darkbluetext,),
                    label: "Чат"
                ),

                NavigationDestination(
                    icon: Icon(Icons.calendar_month_outlined, color: Colors.white,),
                    selectedIcon: Icon(Icons.calendar_month,  color: MyColors.darkbluetext,),
                    label: "Календарь"
                ),

                Spacer(),

                NavigationDestination(
                    icon: Icon(Icons.account_circle_outlined, color: Colors.white,),
                    selectedIcon: Icon(Icons.account_circle, color: MyColors.darkbluetext,),
                    label: "Контакты"
                ),

                NavigationDestination(
                    icon: Icon(Icons.call_outlined, color: Colors.white,),
                    label: "Звонки",
                    selectedIcon: Icon(Icons.call ,  color: MyColors.darkbluetext,),
                )
              ],
            ),
          )
        )
        )

    );
  }
}
