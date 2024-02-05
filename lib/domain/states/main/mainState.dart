
import 'package:mobx/mobx.dart';

part 'mainState.g.dart';

class MainState = _MainState with _$MainState;

abstract class _MainState with Store {

  @observable
  bool isDarkMode = false;


  @action
  void toggleTheme(){
    isDarkMode = !isDarkMode;
  }
}