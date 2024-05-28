import 'package:federal_school/domain/states/home/course/courseInfoViewModel.dart';
import 'package:federal_school/presentation/widgets/GradientContainer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import '../../../../../domain/models/course/CourseModel.dart';
import '../../../../Colors.dart';
import '../../../../widgets/roundedContainer.dart';

class CourseInfoView extends StatefulWidget {
  CourseModel courseModel;

  CourseInfoView({required this.courseModel});

  @override
  State<CourseInfoView> createState() => _CourseInfoViewState();
}

class _CourseInfoViewState extends State<CourseInfoView> {

  late CourseInfoViewModel courseInfoViewModel;

  @override
  void initState() {
    var url = widget.courseModel.videoUrl ??
        "https://www.youtube.com/watch?v=x3VtI_58cfM&t=859s";
    courseInfoViewModel = CourseInfoViewModel();
    courseInfoViewModel.url = url;
    courseInfoViewModel.loadVideo();

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isLightTheme =
    Theme.of(context).brightness == Brightness.dark ? false : true;

    return Observer(
        builder: (context){
          if(courseInfoViewModel.isVideoLoaded){
            return YoutubePlayerScaffold(
                controller: courseInfoViewModel.controller,
                builder: (context, player) {
                  return GradientContainer(
                    child: Scaffold(
                      backgroundColor: Colors.transparent,
                      body: CustomScrollView(
                        primary: true,
                        slivers: [
                          SliverAppBar(
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
                            backgroundColor: Colors.transparent,
                            surfaceTintColor: Colors.transparent,

                          ),


                          SliverToBoxAdapter(
                                    child:  RoundedContainer(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    widget.courseModel.theme,
                                                    textAlign: TextAlign.center,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .labelLarge!
                                                        .copyWith(color: Colors.grey),
                                                  ),
                                                  Container(
                                                    height: 8,
                                                  ),
                                                  Text(widget.courseModel.name,
                                                      textAlign: TextAlign.center,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .titleMedium!
                                                          .copyWith(
                                                          fontWeight: FontWeight.bold,
                                                          fontSize: 22)),
                                                  Container(
                                                    height: 8,
                                                  ),
                                                  widget.courseModel.videoUrl == null
                                                      ? Image.network(
                                                    widget.courseModel.imagePath!,
                                                    loadingBuilder: (BuildContext context,
                                                        Widget child,
                                                        ImageChunkEvent? loadingProgress) {
                                                      if (loadingProgress == null) return child;
                                                      return Center(
                                                        child: CircularProgressIndicator(
                                                          value: loadingProgress
                                                              .expectedTotalBytes !=
                                                              null
                                                              ? loadingProgress
                                                              .cumulativeBytesLoaded /
                                                              loadingProgress
                                                                  .expectedTotalBytes!
                                                              : null,
                                                        ),
                                                      );
                                                    },
                                                  )
                                                      : Observer(builder: (context)=> player),
                                                  Padding(
                                                    padding: EdgeInsets.all(10),
                                                    child: Text(
                                                      widget.courseModel.description,
                                                      style: Theme.of(context).textTheme.titleMedium,
                                                      textAlign: TextAlign.justify,
                                                    ),
                                                  ),


                                                  Row(
                                                    children: [
                                                      Expanded(
                                                        child: Padding(
                                                          padding: EdgeInsets.only(right: 15),
                                                          child: Text("Автор: ${widget.courseModel.creatorID}",
                                                              textAlign: TextAlign.end,
                                                              style: Theme.of(context)
                                                                  .textTheme
                                                                  .titleMedium!
                                                                  .copyWith(color: Colors.grey)),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  RoundedContainer(child: Container(height: 500,),)






                                                ],

                                              ),
                                            )

                              ),

                        ],
                      ),
                    ),
                  );
                });
          }
          else
            return Placeholder();
        }
    );
  }
}
