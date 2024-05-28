import 'dart:io';

import 'package:federal_school/domain/models/course/CourseModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../snackBar.dart';

part 'addCourseViewModel.g.dart';

class AddCourseViewModel = _AddCourseViewModel with _$AddCourseViewModel;

abstract class _AddCourseViewModel with Store{
  late TextEditingController themeController, nameCourseController, descriptionController, urlController, dateController, imageController;

  final formKey = GlobalKey<FormState>();

  @observable
  DateTime? selectedDate;

  @observable
  bool isLoadingPhoto = false;

  @observable
  bool isLoadingData = false;

  final _firebaseStorage = FirebaseStorage.instance;

  File? selectedImage;

  @computed
  String? get selectedDateString{
    return DateFormat.yMMMMd("ru_RU").format(selectedDate!);
  }


  @action
  Future<void> editCourse(CourseModel c) async{

    isLoadingData = true;


    var ref = FirebaseDatabase.instance.ref("courses").child(c.uid);


    String? downloadUrl;
    if(selectedImage != null){
      var snapshot = await _firebaseStorage.ref()
          .child('courses/${ref.key}')
          .putFile(selectedImage!);
      downloadUrl = await snapshot.ref.getDownloadURL();
    }


    var userId = FirebaseAuth.instance.currentUser!.uid;
    CourseModel courseModel = CourseModel(
        uid: ref.key!,
        creatorID: userId,
        imagePath: downloadUrl ?? c.imagePath,
        theme: themeController.text,
        name: nameCourseController.text,
        description: descriptionController.text,
        availableTo: selectedDate ?? DateTime(2050),
        videoUrl: urlController.text == "" ? null : urlController.text
    );

    await ref.update(courseModel.toJson());

    isLoadingData = false;

  }


  @action
  Future<void> addCourse() async{

    isLoadingData = true;

    if(selectedImage == null){
      return;
    }
    var ref = FirebaseDatabase.instance.ref("courses").push();


    var snapshot = await _firebaseStorage.ref()
        .child('courses/${ref.key}')
        .putFile(selectedImage!);
    var downloadUrl = await snapshot.ref.getDownloadURL();

    var userId = FirebaseAuth.instance.currentUser!.uid;
    CourseModel courseModel = CourseModel(
        uid: ref.key!,
        creatorID: userId,
        imagePath: downloadUrl,
        theme: themeController.text,
        name: nameCourseController.text,
        description: descriptionController.text,
        availableTo: selectedDate ?? DateTime(2050),
        videoUrl: urlController.text == "" ? null :urlController.text
    );

    await ref.set(courseModel.toJson());

    isLoadingData = false;

  }

  @action
  String? validate (String? text){
    if(text!.trim().isEmpty){
      return "Введите данные";
    }

  }

  @action
  Future<void> uploadImage() async {
    if (!isLoadingPhoto) {
      isLoadingPhoto = true;
      await Permission.storage.request();
      final _imagePicker = ImagePicker();
      XFile? image;
      await Permission.photos.request();

      var permissionStatus = await Permission.storage.isGranted ||
          await Permission.photos.isGranted;

      if (permissionStatus) {
        //Select Image
        isLoadingPhoto = true;
        image = await _imagePicker.pickImage(source: ImageSource.gallery);
        if (image == null) {
          isLoadingPhoto = false;
          return;
        }
        selectedImage = File(image.path);


        //Upload to Firebase
        imageController.text = image.name;
      }
      else {
        SnackbarGlobal.show("Вы не дали разрешение для работы с фото");
      }

      isLoadingPhoto = false;
    }
  }
}