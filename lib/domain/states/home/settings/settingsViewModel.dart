
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';

part 'settingsViewModel.g.dart';

class SettingsViewModel = _SettingsViewModel with _$SettingsViewModel;

abstract class _SettingsViewModel with Store{

  @observable
  bool _hasPushes = true;


  @computed
  bool get hasPushes => _hasPushes;

  @action
  void toggleSwitcher(bool value){
    _hasPushes = value;
  }

  Future<void> signOut() async{
    await FirebaseAuth.instance.signOut();
  }
}