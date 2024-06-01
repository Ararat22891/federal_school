import 'package:federal_school/domain/states/home/course/courseViewModel.dart';
import 'package:federal_school/presentation/pages/home/call/courseViewAsset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CourseView extends StatefulWidget {
  @override
  State<CourseView> createState() => _CourseViewState();
}

class _CourseViewState extends State<CourseView> {
  CourseViewModel courseViewModel = CourseViewModel();

  @override
  void initState() {
    courseViewModel.getCourses();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
        builder: (context){
          return  ListView.builder(
              itemCount: courseViewModel.courses.length,
              itemBuilder: (context, index){
                return CourseViewAsset(courseModel: courseViewModel.courses[index]);
              }
          );
        }
    );
  }
}
