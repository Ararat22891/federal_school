// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userDataSingltone.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserDataSingltone on _UserDataSingltone, Store {
  late final _$instanceAtom =
      Atom(name: '_UserDataSingltone.instance', context: context);

  @override
  UserData? get instance {
    _$instanceAtom.reportRead();
    return super.instance;
  }

  @override
  set instance(UserData? value) {
    _$instanceAtom.reportWrite(value, super.instance, () {
      super.instance = value;
    });
  }

  late final _$getInstanceAsyncAction =
      AsyncAction('_UserDataSingltone.getInstance', context: context);

  @override
  Future<void> getInstance(DatabaseReference ref) {
    return _$getInstanceAsyncAction.run(() => super.getInstance(ref));
  }

  late final _$_UserDataSingltoneActionController =
      ActionController(name: '_UserDataSingltone', context: context);

  @override
  void setInstance(UserData data) {
    final _$actionInfo = _$_UserDataSingltoneActionController.startAction(
        name: '_UserDataSingltone.setInstance');
    try {
      return super.setInstance(data);
    } finally {
      _$_UserDataSingltoneActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
instance: ${instance}
    ''';
  }
}
