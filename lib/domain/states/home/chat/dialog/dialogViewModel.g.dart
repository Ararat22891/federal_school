// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dialogViewModel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DialogViewModel on _DialogViewModel, Store {
  late final _$isDataLoadedAtom =
      Atom(name: '_DialogViewModel.isDataLoaded', context: context);

  @override
  bool get isDataLoaded {
    _$isDataLoadedAtom.reportRead();
    return super.isDataLoaded;
  }

  @override
  set isDataLoaded(bool value) {
    _$isDataLoadedAtom.reportWrite(value, super.isDataLoaded, () {
      super.isDataLoaded = value;
    });
  }

  late final _$dialogsAtom =
      Atom(name: '_DialogViewModel.dialogs', context: context);

  @override
  List<DialogModel> get dialogs {
    _$dialogsAtom.reportRead();
    return super.dialogs;
  }

  @override
  set dialogs(List<DialogModel> value) {
    _$dialogsAtom.reportWrite(value, super.dialogs, () {
      super.dialogs = value;
    });
  }

  late final _$controllerAtom =
      Atom(name: '_DialogViewModel.controller', context: context);

  @override
  TextEditingController get controller {
    _$controllerAtom.reportRead();
    return super.controller;
  }

  bool _controllerIsInitialized = false;

  @override
  set controller(TextEditingController value) {
    _$controllerAtom.reportWrite(
        value, _controllerIsInitialized ? super.controller : null, () {
      super.controller = value;
      _controllerIsInitialized = true;
    });
  }

  late final _$isSendableAtom =
      Atom(name: '_DialogViewModel.isSendable', context: context);

  @override
  bool get isSendable {
    _$isSendableAtom.reportRead();
    return super.isSendable;
  }

  @override
  set isSendable(bool value) {
    _$isSendableAtom.reportWrite(value, super.isSendable, () {
      super.isSendable = value;
    });
  }

  late final _$sendMessageAsyncAction =
      AsyncAction('_DialogViewModel.sendMessage', context: context);

  @override
  Future<void> sendMessage(String myUid, String foreignUID) {
    return _$sendMessageAsyncAction
        .run(() => super.sendMessage(myUid, foreignUID));
  }

  late final _$_DialogViewModelActionController =
      ActionController(name: '_DialogViewModel', context: context);

  @override
  void onChanged(String text) {
    final _$actionInfo = _$_DialogViewModelActionController.startAction(
        name: '_DialogViewModel.onChanged');
    try {
      return super.onChanged(text);
    } finally {
      _$_DialogViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void getMessages(String myUid, String foreignUID) {
    final _$actionInfo = _$_DialogViewModelActionController.startAction(
        name: '_DialogViewModel.getMessages');
    try {
      return super.getMessages(myUid, foreignUID);
    } finally {
      _$_DialogViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isDataLoaded: ${isDataLoaded},
dialogs: ${dialogs},
controller: ${controller},
isSendable: ${isSendable}
    ''';
  }
}
