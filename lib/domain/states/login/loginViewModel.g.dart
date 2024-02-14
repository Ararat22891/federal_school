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

  late final _$isCodeVerifiedAtom =
      Atom(name: '_LoginViewModel.isCodeVerified', context: context);

  @override
  bool get isCodeVerified {
    _$isCodeVerifiedAtom.reportRead();
    return super.isCodeVerified;
  }

  @override
  set isCodeVerified(bool value) {
    _$isCodeVerifiedAtom.reportWrite(value, super.isCodeVerified, () {
      super.isCodeVerified = value;
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

  late final _$checkOTPAsyncAction =
      AsyncAction('_LoginViewModel.checkOTP', context: context);

  @override
  Future<bool> checkOTP() {
    return _$checkOTPAsyncAction.run(() => super.checkOTP());
  }

  @override
  String toString() {
    return '''
phoneNumber: ${phoneNumber},
verificaionCode: ${verificaionCode},
isCodeVerified: ${isCodeVerified},
pinEditingController: ${pinEditingController},
verificationId: ${verificationId}
    ''';
  }
}
