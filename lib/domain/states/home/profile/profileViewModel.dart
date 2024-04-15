
import 'dart:io';

import 'package:federal_school/snackBar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import 'package:permission_handler/permission_handler.dart';

part 'profileViewModel.g.dart';

class ProfileViewModel = _ProfileViewModel with _$ProfileViewModel;


abstract class _ProfileViewModel with Store{

  @observable
  bool isEdit = false;

  @observable
  bool isLoadingPhoto = false;

  @observable
  String fio = "";
  late TextEditingController controller;
  final formKey = GlobalKey<FormState>();

  @observable
  User? user = FirebaseAuth.instance.currentUser;

  @computed
  String? get fullName{
    if (user != null){
      return user!.displayName;
    }
    return null;
  }


  @action
  void saveData(User user){
      String displayName = controller.value.text.trim();
      user.updateDisplayName(displayName);
      String surn = displayName.split(" ")[0];
      String name = displayName.split(" ")[1];
      String patr = displayName.split(" ")[2];

      FirebaseDatabase.instance.ref("users").child(user.uid).update({
        "surname": surn,
        "name": name,
        "patronomyc": patr,
      });
  }

  @action
  String? validateFIO (String? text){
    if(text!.trim()!.isEmpty){
      return "Введите свое ФИО";
    }
    else if (text!.trim().split(" ").length != 3){
      return "Введите полностью свое ФИО";
    }
    else {
      RegExp r = RegExp(r'^[А-ЯЁ][а-яё]+(-[А-ЯЁ][а-яё]+)?\s[А-ЯЁ][а-яё]+(-[А-ЯЁ][а-яё]+)?\s[А-ЯЁ][а-яё]+(-[А-ЯЁ][а-яё]+)?$');
      if (r.hasMatch(text.trim())) {
        return null; // valid FIO
      }
      else {
        return "Введите корректное ФИО";
      }
    }
  }


  @action
  Future<void> uploadProfile() async {
    if (!isLoadingPhoto && isEdit) {
      final _firebaseStorage = FirebaseStorage.instance;
      await Permission.storage.request();
      final _imagePicker = ImagePicker();
      XFile? image;
      //Check Permissions
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
        var file = File(image!.path);


        //Upload to Firebase
        var snapshot = await _firebaseStorage.ref()
            .child('avatars/${user!.uid}')
            .putFile(file);
        var downloadUrl = await snapshot.ref.getDownloadURL();

        await user?.updatePhotoURL(downloadUrl);
        FirebaseDatabase.instance.ref("users").child(user!.uid).update({
          "photoPath": downloadUrl,
        });
      }
      else {
        SnackbarGlobal.show("Вы не дали разрешение для работы с фото");
      }
      isLoadingPhoto = false;
    }
  }



}
