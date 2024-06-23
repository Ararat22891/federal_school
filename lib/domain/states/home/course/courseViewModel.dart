
import 'package:federal_school/domain/models/user/user.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:mobx/mobx.dart';

import '../../../models/course/CourseModel.dart';

part 'courseViewModel.g.dart';

class CourseViewModel = _CourseViewModel with _$CourseViewModel;

abstract class _CourseViewModel with Store{

  @observable
  ObservableList<CourseModel> courses = ObservableList();

  @observable
  bool isLoading = false;

  @action
  Future<void> getCourses() async{
    FirebaseDatabase.instance.ref("courses").onValue.listen((event) async{
      isLoading = true;
      for(DataSnapshot snapshot in event.snapshot.children){
        final data = Map<String, dynamic>.from(snapshot.value as Map);
        CourseModel courseData = CourseModel.fromJson(data);
        
        var userInfoSnap = await FirebaseDatabase.instance.ref("users").child(courseData.creatorID).get();
        final userInfoMap = Map<String, dynamic>.from(userInfoSnap.value as Map);
        UserData userData = UserData.fromJson(userInfoMap);
        String fio = userData.surname == null ? "Преподаватель" :"${userData!.surname} ${userData.name} ${userData.patronomyc}";
        courseData.creatorID = courseData.creatorID+"^"+fio;
        bool isAvailable = courseData.availableTo.isAfter(DateTime.now());

        if(isAvailable && !courses.any(
                (element) => element.uid == courseData.uid)
        ) courses.add(courseData);
        else if (isAvailable && courses.any(
        (element) => element.uid == courseData.uid)){
          var change = courses.where((element){
           return element.uid == courseData.uid;
          }).first;
          int index = courses.indexOf(change);
          courses[index] = courseData;
        }
      }
      isLoading = false;
    });
  }
}