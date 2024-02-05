
import 'package:federal_school/presentation/Colors.dart';
import 'package:federal_school/textStyles/textStyles.dart';
import 'package:flutter/material.dart';

class EventViewAsset extends StatelessWidget {
  const EventViewAsset({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: MyColors.white,
        shadowColor: MyColors.white,
        color: MyColors.white,
        elevation: 12,
        child: Container(
          padding: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: MyColors.blue70
                        ),
                      ),

                      Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white
                        ),
                      ),
                    ],
                  ),
                  Container(width: 12,),
                  Text("10:22–13:00", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 14),)
                ],
              ),
              Container(height: 8,),
              Text("Лекция с Явлинским", overflow: TextOverflow.ellipsis, maxLines: 1, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
              Container(height: 8,),
              Text("Быть всем!", style: TextStyle(color: Colors.grey,))
            ],
          ),
        )
      );


  }
}
