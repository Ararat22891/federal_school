// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loginViewModel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginViewModel on _LoginViewModel, Store {
  late final _$phoneNumberAtom =
      Atom(name: '_LoginViewModel.phoneNumber', context: context);

  @override
  String get phoneNumber {
    _$phoneNumberAtom.reportRead();
    return super.phoneNumber;
  }

  @override
  set phoneNumber(String value) {
    _$phoneNumberAtom.reportWrite(value, super.phoneNumber, () {
      super.phoneNumber = value;
    });
  }

  late final _$verificaionCodeAtom =
      Atom(name: '_LoginViewModel.verificaionCode', context: context);

  @override
  String? get verificaionCode {
    _$verificaionCodeAtom.reportRead();
    return super.verificaionCode;
  }

  @override
  set verificaionCode(String? value) {
    _$verificaionCodeAtom.reportWrite(value, super.verificaionCode, () {
      super.verificaionCode = value;
    });
  }

  late final _$timeAtom = Atom(name: '_LoginViewModel.time', context: context);

  @override
  int get time {
    _$timeAtom.reportRead();
    return super.time;
  }

  @override
  set time(int value) {
    _$timeAtom.reportWrite(value, super.time, () {
      super.time = value;
    });
  }

  late final _$errorVisibilityAtom =
      Atom(name: '_LoginViewModel.errorVisibility', context: context);

  @override
  bool get errorVisibility {
    _$errorVisibilityAtom.reportRead();
    return super.errorVisibility;
  }

  @override
  set errorVisibility(bool value) {
    _$errorVisibilityAtom.reportWrite(value, super.errorVisibility, () {
      super.errorVisibility = value;
    });
  }

  late final _$verificationIdAtom =
      Atom(name: '_LoginViewModel.verificationId', context: context);

  @override
  String get verificationId {
    _$verificationIdAtom.reportRead();
    return super.verificationId;
  }

  @override
  set verificationId(String value) {
    _$verificationIdAtom.reportWrite(value, super.verificationId, () {
      super.verificationId = value;
    });
  }

  late final _$statusAtom =
      Atom(name: '_LoginViewModel.status', context: context);

  @override
  AuthStatus get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(AuthStatus value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  late final _$pinEditingControllerAtom =
      Atom(name: '_LoginViewModel.pinEditingController', context: context);

  @override
  TextEditingController get pinEditingController {
    _$pinEditingControllerAtom.reportRead();
    return super.pinEditingController;
  }

  @override
  set pinEditingController(TextEditingController value) {
    _$pinEditingControllerAtom.reportWrite(value, super.pinEditingController,
        () {
      super.pinEditingController = value;
    });
  }

  late final _$signInWithTelephoneAsyncAction =
      AsyncAction('_LoginViewModel.signInWithTelephone', context: context);

  @override
  Future<void> signInWithTelephone() {
    return _$signInWithTelephoneAsyncAction
        .run(() => super.signInWithTelephone());
  }

  late final _$checkOTPAsyncAction =
      AsyncAction('_LoginViewModel.checkOTP', context: context);

  @override
  Future<void> checkOTP() {
    return _$checkOTPAsyncAction.run(() => super.checkOTP());
  }

  late final _$_LoginViewModelActionController =
      ActionController(name: '_LoginViewModel', context: context);

  @override
  void startTimer() {
    final _$actionInfo = _$_LoginViewModelActionController.startAction(
        name: '_LoginViewModel.startTimer');
    try {
      return super.startTimer();
    } finally {
      _$_LoginViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
phoneNumber: ${phoneNumber},
verificaionCode: ${verificaionCode},
time: ${time},
errorVisibility: ${errorVisibility},
verificationId: ${verificationId},
status: ${status},
pinEditingController: ${pinEditingController}
    ''';
  }
}
