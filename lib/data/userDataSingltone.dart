
import 'package:firebase_database/firebase_database.dart';
import 'package:mobx/mobx.dart';
import '../domain/models/user/user.dart';

part 'userDataSingltone.g.dart';




class GlobalSingltone{
  static UserDataSingltone? _singltone;

  static UserDataSingltone getInstanse(){
    if(_singltone == null)
      _singltone = UserDataSingltone();
    return _singltone!;
  }
}

class UserDataSingltone = _UserDataSingltone with _$UserDataSingltone;


abstract class _UserDataSingltone with Store{
    @observable
     UserData? instance;

   UserDataSingltone() {}

    @action
    Future<void> getInstance(DatabaseReference ref) async {
    if (instance == null){
      var snap = await ref.get();

      if(snap.exists){

        final data = Map<String, dynamic>.from(snap.value as Map);
        instance = UserData.fromJson(data);
      }
    }

  }

  @action
   void setInstance(UserData data){
     instance = data;
  }
}