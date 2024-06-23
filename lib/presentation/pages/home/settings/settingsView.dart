import 'package:federal_school/domain/states/home/settings/settingsViewModel.dart';
import 'package:federal_school/presentation/pages/login/loginView.dart';
import 'package:federal_school/presentation/widgets/GradientContainer.dart';
import 'package:federal_school/presentation/widgets/roundedContainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../../../Colors.dart';

class SettingsView extends StatelessWidget {
  SettingsView({super.key});
  SettingsViewModel state = SettingsViewModel();

  @override
  Widget build(BuildContext context) {
    bool isLightTheme =
    Theme.of(context).brightness == Brightness.dark ? false : true;

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
          Image.asset(
              "assets/settings_cat.png",
              scale: 3,
            ),

         Expanded(
             child: RoundedContainer(
               padding: EdgeInsets.all(12),
               child: Column(
                 mainAxisSize: MainAxisSize.max,
                 children: [
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
                   SizedBox(height: 12,),
                   Container(
                       decoration: BoxDecoration(
                           border: Border.all(width: 1, color: MyColors.darkbluetext),
                           borderRadius: BorderRadius.circular(12)),
                       child: GestureDetector(
                         child: ListTile(
                           title: Text(
                             "О нас",
                             style: Theme.of(context).textTheme.titleMedium
                           ),
                           subtitle: Text(
                             "Узнать о нас",
                             style: Theme.of(context).textTheme.titleMedium!.copyWith(
                               fontSize: 12
                             )
                           ),
                           trailing:  Icon(
                             Icons.chevron_right_outlined,
                             size: 30,
                           )
                           ,
                         ),
                         onTap: () async{
                           await launchUrlString("https://www.yabloko.ru", mode: LaunchMode.inAppBrowserView);
                         },
                       )
                   ),
                   Container(
                     height: 12,
                   ),
                   Container(
                       decoration: BoxDecoration(
                           border:
                           Border.all(width: 1, color: MyColors.darkbluetext),
                           borderRadius: BorderRadius.circular(12)),

                       child: GestureDetector(
                         onTap: () async{
                           await launchUrlString("https://school.yabloko.ru", mode: LaunchMode.inAppBrowserView);
                         },
                         child: ListTile(
                             title: Text(
                               "О ФПШ",
                                 style: Theme.of(context).textTheme.titleMedium

                             ),
                             subtitle: Text(
                               "Все о партийной школе",
                                 style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                     fontSize: 12
                                 )
                             ),
                             trailing: Icon(
                               Icons.chevron_right_outlined,
                               size: 30,
                             )
                         ),
                       )
                   ),
                   
                   Expanded(
                     child: Padding(
                         padding: EdgeInsets.only(bottom: 12),
                       child: Align(
                           alignment: Alignment.bottomCenter,
                           child: FilledButton.tonalIcon(
                             onPressed: () async{
                               await state.signOut();
                               Navigator.of(context).pushAndRemoveUntil(
                                   MaterialPageRoute(builder: (context) => LoginView()),
                                       (route) => false
                               );
                             },
                             icon: Icon(
                               Icons.exit_to_app,
                               color: Colors.white,
                             ),
                             label: Text("Выйти",
                                 style: TextStyle(color: Colors.white, fontSize: 24)),
                             style:
                             FilledButton.styleFrom(backgroundColor: Colors.red),
                           )),
                     )
                   ),

                   SizedBox(height: 20,)
                 ],
               ),
             ),)
        ],
      ),

    ));
  }
}
