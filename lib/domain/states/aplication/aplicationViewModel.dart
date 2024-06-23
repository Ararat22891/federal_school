
import 'package:federal_school/domain/models/aplication/aplicationModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

part 'aplicationViewModel.g.dart';

class AplicationViewModel = _AplicationViewModel with _$AplicationViewModel;

enum Status {get, loading, serverError, clientError, empty}

abstract class _AplicationViewModel with Store{

  late TextEditingController textEditingController;
  @observable
  Status status = Status.empty;

  @action
  Future<void> createPetition() async{
    try{
      status = Status.loading;
      var user = FirebaseAuth.instance.currentUser!;
      AplicationModel petition = AplicationModel(
          text: textEditingController.text,
          userUid: user.uid
      );

      var petitionMap = petition.toJson();

      await FirebaseDatabase.instance.ref("petitions").child(user.uid).set(
          petitionMap
      );


      status = Status.get;
    }
    catch(ex){
      status = Status.serverError;
    }

  }


  @action
  Future<void> getStatus() async{
    try{
      status = Status.loading;
      var user = FirebaseAuth.instance.currentUser!;

      var snapshot = await FirebaseDatabase.instance.ref("petitions").child(user.uid).get();

      if(snapshot.exists){
          status = Status.get;
      }
      else{
        status = Status.empty;
      }
    }
    catch(ex){
      status = Status.serverError;
    }
  }
}