import 'package:federal_school/presentation/widgets/GradientContainer.dart';
import 'package:federal_school/presentation/widgets/roundedContainer.dart';
import 'package:flutter/material.dart';
import '../../../Colors.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientContainer(
        child: Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        titleSpacing: 0,
        centerTitle: true,
        title: Text(
          "Настройки",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 26),
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Flexible(
            child: Image.asset(
              "assets/settings_cat.png",
              scale: 3,
            ),
          ),
          RoundedContainer(
            padding: EdgeInsets.all(12),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  children: [
                    Text(
                      "Уведомления",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(fontSize: 24),
                    ),
                    Spacer()
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      border:
                          Border.all(width: 1, color: MyColors.darkbluetext),
                      borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Push-уведомления",
                            style: TextStyle(
                                color: MyColors.darkbluetext,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          Text(
                            "Получать уведомления от чатов, звонков, событий",
                            style: TextStyle(
                                color: MyColors.darkbluetext,
                                fontWeight: FontWeight.bold,
                                fontSize: 12),
                          ),
                        ],
                      ),
                      Spacer(),
                      Switch(value: true, onChanged: (sas) {})
                    ],
                  ),
                ),
                Container(
                  height: 12,
                ),
                Row(
                  children: [
                    Text("Поддержка",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(fontSize: 24)),
                    Spacer()
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      border:
                          Border.all(width: 1, color: MyColors.darkbluetext),
                      borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "О нас",
                            style: TextStyle(
                                color: MyColors.darkbluetext,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          Text(
                            "Узнать о нас",
                            style: TextStyle(
                                color: MyColors.darkbluetext,
                                fontWeight: FontWeight.bold,
                                fontSize: 12),
                          ),
                        ],
                      ),
                      Spacer(),
                      Icon(
                        Icons.chevron_right_outlined,
                        size: 30,
                      )
                    ],
                  ),
                ),
                Container(
                  height: 12,
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      border:
                          Border.all(width: 1, color: MyColors.darkbluetext),
                      borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "О приложении",
                            style: TextStyle(
                                color: MyColors.darkbluetext,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          Text(
                            "Все о приложении",
                            style: TextStyle(
                                color: MyColors.darkbluetext,
                                fontWeight: FontWeight.bold,
                                fontSize: 12),
                          ),
                        ],
                      ),
                      Spacer(),
                      Icon(
                        Icons.chevron_right_outlined,
                        size: 30,
                      )
                    ],
                  ),
                ),
                Container(
                  height: 60,
                ),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: FilledButton.tonalIcon(
                      onPressed: () {},
                      icon: Icon(
                        Icons.exit_to_app,
                        color: Colors.white,
                      ),
                      label: Text("Выйти",
                          style: TextStyle(color: Colors.white, fontSize: 24)),
                      style:
                          FilledButton.styleFrom(backgroundColor: Colors.red),
                    )),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
