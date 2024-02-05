import 'package:federal_school/presentation/widgets/GradientContainer.dart';
import 'package:federal_school/textStyles/textStyles.dart';
import 'package:flutter/material.dart';

import '../../../Colors.dart';

class MyProfileView extends StatelessWidget {
  const MyProfileView({super.key});


  @override
  Widget build(BuildContext context) {
    var isLightTheme = Theme.of(context).brightness == Brightness.light;
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: Material(
          elevation: 10,
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12), bottomRight: Radius.circular(12)),
          child: GradientContainer(

            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                AppBar(
                  backgroundColor: Colors.transparent,
                  centerTitle: true,
                  foregroundColor: Colors.white,
                  actions: [
                    IconButton(onPressed: () {}, icon: Icon(Icons.edit))
                  ],
                  title: Text(
                    "Профиль",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                FittedBox(
                  child: CircleAvatar(
                    foregroundImage: Image.network(
                        "https://www.yabloko.ru/Persons/YAVL/Gallery/ya99p011.jpg")
                        .image,
                    backgroundImage: Image.asset("assets/bird.jpg").image,
                    maxRadius: MediaQuery.of(context).size.height / 5.5,
                  ),
                ),

                Spacer()


              ],
            ),
          ),
        ),
        ),
        Flexible(
          flex: 2,
            child: Container(
              color: isLightTheme ? MyColors.white : MyColors.darkThemeContainer,
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(height: 50,),
                  Text("ФИО",
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  TextFormField(
                    initialValue: "Явлинский Григорий Алексеевич",
                    style: Theme.of(context).textTheme.titleMedium,
                    enabled: false,
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.symmetric(horizontal: 6),
                    ),
                  ),

                  Container(height: 12,),
                  Text("Номер телефона",
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  TextFormField(
                    initialValue: "+7 (960) 077-74-66",
                    style: Theme.of(context).textTheme.titleMedium,
                    enabled: false,
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.symmetric(horizontal: 6),

                    ),
                  ),

                  Container(height: 12,),

                  Text("Статус",
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  TextFormField(
                    initialValue: "Преподаватель",
                    style: Theme.of(context).textTheme.titleMedium,
                    enabled: false,
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.symmetric(horizontal: 6),
                    ),
                  ),

                ],
              ),
            ),
        )

      ],
    );
  }
}
