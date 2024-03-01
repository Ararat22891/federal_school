
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:mobx/mobx.dart';

import '../../../models/user/user.dart';


part 'contactViewModel.g.dart';

class ContactViewModel = _ContactViewModel with _$ContactViewModel;


abstract class _ContactViewModel with Store{



  @observable
  List<UserData>? contacts = [];


  @observable
  bool isLoaded = false;

  @action
  Future<void> getData() async{
    FirebaseDatabase.instance.ref("users").onValue.listen(
            (event) {
              isLoaded = false;
              contacts!.clear();
              for (final child in event.snapshot.children){
                final data = Map<String, dynamic>.from(child.value as Map);
                UserData userData = UserData.fromJson(data);
                if (userData.userUID != FirebaseAuth.instance.currentUser!.uid)
                  contacts?.add(userData);

              }
              isLoaded = true;
            }
    );
  }
}