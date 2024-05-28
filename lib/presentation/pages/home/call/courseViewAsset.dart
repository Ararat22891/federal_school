
import 'package:federal_school/data/userDataSingltone.dart';
import 'package:federal_school/presentation/pages/home/call/addCourse/addCourseView.dart';
import 'package:federal_school/presentation/pages/home/call/courseInfo/courseInfoView.dart';
import 'package:federal_school/presentation/widgets/MyCircleAvatar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:googleapis/cloudsearch/v1.dart';
import 'package:intl/intl.dart';

import '../../../../domain/models/course/CourseModel.dart';
import '../../../Colors.dart';

class CourseViewAsset extends StatelessWidget {

  CourseModel courseModel;

  CourseViewAsset({required this.courseModel});



  @override
  Widget build(BuildContext context) {
    var isLightTheme = Theme.of(context).brightness == Brightness.light;
    var userRole = GlobalSingltone.getInstanse().instance!.role;
    bool canEdit = courseModel.creatorID == FirebaseAuth.instance.currentUser!.uid && userRole == 2 ? true : false;

    return Material(
        color: Colors.transparent ,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 6),

          child: InkWell(
              onTap: (){
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context){
                    return CourseInfoView(courseModel: courseModel);
                  })
                );
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 14),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),

                      ),
                      clipBehavior: Clip.antiAlias,

                      child: FadeInImage.assetNetwork(
                        placeholder: "assets/bird.jpg",
                        image: courseModel.imagePath!,
                        fit: BoxFit.cover,
                        width: 60, height: 60,
                      ),
                    ),

                    Container(width: 12,),


                    Expanded(child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(courseModel.name,
                          style: Theme.of(context).textTheme.titleMedium,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Row(
                          children: [

                            Text(courseModel.theme, style: TextStyle(color: Colors.grey, fontSize: 12,), overflow: TextOverflow.ellipsis,),
                          ],
                        )
                      ],
                    ),),


                    IconButton(
                        onPressed:
                        canEdit ? (){
                          showDialog(
                              context: context,
                              builder: (context){
                                return AddCourseView.create(
                                  courseModel: courseModel,
                                );
                              }
                          );
                        } : null,
                        icon:
                        Icon(
                         canEdit ? Icons.edit : Icons.chevron_right,
                          color: isLightTheme ? MyColors.darkbluetext : MyColors.darkThemeFont,
                        )
                    ),

                  ],
                ),
              )
          ),
        )
    );
  }


  String formatMessageDate(DateTime messageDateTime) {
    DateTime now = DateTime.now();
    Duration difference = now.difference(messageDateTime);
    String dayOfWeek = DateFormat.EEEE('ru').format(messageDateTime);
    if (difference.inDays == 0) {
      // Сообщение отправлено сегодня
      return " Сегодня, ${DateFormat.Hm('ru').format(messageDateTime)}";

    } else if (difference.inDays < 7) {
      return " ${dayOfWeek}, ${DateFormat.Hm('ru').format(messageDateTime)}";
    } else if (difference.inDays < 365){
      return DateFormat.MMMd('ru').format(messageDateTime); // День и месяц
    }
    else {
      // Сообщение отправлено ранее
      return DateFormat.yMMMd('ru').format(messageDateTime); // День и месяц
    }
  }

}
