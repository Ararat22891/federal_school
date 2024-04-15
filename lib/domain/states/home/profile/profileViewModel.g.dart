// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profileViewModel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProfileViewModel on _ProfileViewModel, Store {
  Computed<String?>? _$fullNameComputed;

  @override
  String? get fullName =>
      (_$fullNameComputed ??= Computed<String?>(() => super.fullName,
              name: '_ProfileViewModel.fullName'))
          .value;

  late final _$isEditAtom =
      Atom(name: '_ProfileViewModel.isEdit', context: context);

  @override
  bool get isEdit {
    _$isEditAtom.reportRead();
    return super.isEdit;
  }

  @override
  set isEdit(bool value) {
    _$isEditAtom.reportWrite(value, super.isEdit, () {
      super.isEdit = value;
    });
  }

  late final _$isLoadingPhotoAtom =
      Atom(name: '_ProfileViewModel.isLoadingPhoto', context: context);

  @override
  bool get isLoadingPhoto {
    _$isLoadingPhotoAtom.reportRead();
    return super.isLoadingPhoto;
  }

  @override
  set isLoadingPhoto(bool value) {
    _$isLoadingPhotoAtom.reportWrite(value, super.isLoadingPhoto, () {
      super.isLoadingPhoto = value;
    });
  }

  late final _$fioAtom = Atom(name: '_ProfileViewModel.fio', context: context);

  @override
  String get fio {
    _$fioAtom.reportRead();
    return super.fio;
  }

  @override
  set fio(String value) {
    _$fioAtom.reportWrite(value, super.fio, () {
      super.fio = value;
    });
  }

  late final _$userAtom =
      Atom(name: '_ProfileViewModel.user', context: context);

  @override
  User? get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(User? value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$uploadProfileAsyncAction =
      AsyncAction('_ProfileViewModel.uploadProfile', context: context);

  @override
  Future<void> uploadProfile() {
    return _$uploadProfileAsyncAction.run(() => super.uploadProfile());
  }

  late final _$_ProfileViewModelActionController =
      ActionController(name: '_ProfileViewModel', context: context);

  @override
  void saveData(User user) {
    final _$actionInfo = _$_ProfileViewModelActionController.startAction(
        name: '_ProfileViewModel.saveData');
    try {
      return super.saveData(user);
    } finally {
      _$_ProfileViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String? validateFIO(String? text) {
    final _$actionInfo = _$_ProfileViewModelActionController.startAction(
        name: '_ProfileViewModel.validateFIO');
    try {
      return super.validateFIO(text);
    } finally {
      _$_ProfileViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isEdit: ${isEdit},
isLoadingPhoto: ${isLoadingPhoto},
fio: ${fio},
user: ${user},
fullName: ${fullName}
    ''';
  }
}
