// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'addCourseViewModel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AddCourseViewModel on _AddCourseViewModel, Store {
  Computed<String?>? _$selectedDateStringComputed;

  @override
  String? get selectedDateString => (_$selectedDateStringComputed ??=
          Computed<String?>(() => super.selectedDateString,
              name: '_AddCourseViewModel.selectedDateString'))
      .value;

  late final _$selectedDateAtom =
      Atom(name: '_AddCourseViewModel.selectedDate', context: context);

  @override
  DateTime? get selectedDate {
    _$selectedDateAtom.reportRead();
    return super.selectedDate;
  }

  @override
  set selectedDate(DateTime? value) {
    _$selectedDateAtom.reportWrite(value, super.selectedDate, () {
      super.selectedDate = value;
    });
  }

  late final _$isLoadingPhotoAtom =
      Atom(name: '_AddCourseViewModel.isLoadingPhoto', context: context);

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

  late final _$isLoadingDataAtom =
      Atom(name: '_AddCourseViewModel.isLoadingData', context: context);

  @override
  bool get isLoadingData {
    _$isLoadingDataAtom.reportRead();
    return super.isLoadingData;
  }

  @override
  set isLoadingData(bool value) {
    _$isLoadingDataAtom.reportWrite(value, super.isLoadingData, () {
      super.isLoadingData = value;
    });
  }

  late final _$editCourseAsyncAction =
      AsyncAction('_AddCourseViewModel.editCourse', context: context);

  @override
  Future<void> editCourse(CourseModel c) {
    return _$editCourseAsyncAction.run(() => super.editCourse(c));
  }

  late final _$addCourseAsyncAction =
      AsyncAction('_AddCourseViewModel.addCourse', context: context);

  @override
  Future<void> addCourse() {
    return _$addCourseAsyncAction.run(() => super.addCourse());
  }

  late final _$uploadImageAsyncAction =
      AsyncAction('_AddCourseViewModel.uploadImage', context: context);

  @override
  Future<void> uploadImage() {
    return _$uploadImageAsyncAction.run(() => super.uploadImage());
  }

  late final _$_AddCourseViewModelActionController =
      ActionController(name: '_AddCourseViewModel', context: context);

  @override
  String? validate(String? text) {
    final _$actionInfo = _$_AddCourseViewModelActionController.startAction(
        name: '_AddCourseViewModel.validate');
    try {
      return super.validate(text);
    } finally {
      _$_AddCourseViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedDate: ${selectedDate},
isLoadingPhoto: ${isLoadingPhoto},
isLoadingData: ${isLoadingData},
selectedDateString: ${selectedDateString}
    ''';
  }
}
