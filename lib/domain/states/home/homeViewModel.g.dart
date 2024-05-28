// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'homeViewModel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeViewModel on _HomeViewModel, Store {
  Computed<String>? _$roleComputed;

  @override
  String get role => (_$roleComputed ??=
          Computed<String>(() => super.role, name: '_HomeViewModel.role'))
      .value;
  Computed<String?>? _$fullNameComputed;

  @override
  String? get fullName =>
      (_$fullNameComputed ??= Computed<String?>(() => super.fullName,
              name: '_HomeViewModel.fullName'))
          .value;

  late final _$selectedIndexAtom =
      Atom(name: '_HomeViewModel.selectedIndex', context: context);

  @override
  int get selectedIndex {
    _$selectedIndexAtom.reportRead();
    return super.selectedIndex;
  }

  @override
  set selectedIndex(int value) {
    _$selectedIndexAtom.reportWrite(value, super.selectedIndex, () {
      super.selectedIndex = value;
    });
  }

  late final _$userDataAtom =
      Atom(name: '_HomeViewModel.userData', context: context);

  @override
  UserData? get userData {
    _$userDataAtom.reportRead();
    return super.userData;
  }

  @override
  set userData(UserData? value) {
    _$userDataAtom.reportWrite(value, super.userData, () {
      super.userData = value;
    });
  }

  late final _$getUserDataAsyncAction =
      AsyncAction('_HomeViewModel.getUserData', context: context);

  @override
  Future<void> getUserData() {
    return _$getUserDataAsyncAction.run(() => super.getUserData());
  }

  late final _$_HomeViewModelActionController =
      ActionController(name: '_HomeViewModel', context: context);

  @override
  void onDestinationSelected(int selectedIndex) {
    final _$actionInfo = _$_HomeViewModelActionController.startAction(
        name: '_HomeViewModel.onDestinationSelected');
    try {
      return super.onDestinationSelected(selectedIndex);
    } finally {
      _$_HomeViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedIndex: ${selectedIndex},
userData: ${userData},
role: ${role},
fullName: ${fullName}
    ''';
  }
}
