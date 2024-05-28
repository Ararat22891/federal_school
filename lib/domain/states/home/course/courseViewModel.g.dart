// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'courseViewModel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CourseViewModel on _CourseViewModel, Store {
  late final _$coursesAtom =
      Atom(name: '_CourseViewModel.courses', context: context);

  @override
  ObservableList<CourseModel> get courses {
    _$coursesAtom.reportRead();
    return super.courses;
  }

  @override
  set courses(ObservableList<CourseModel> value) {
    _$coursesAtom.reportWrite(value, super.courses, () {
      super.courses = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_CourseViewModel.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$getCoursesAsyncAction =
      AsyncAction('_CourseViewModel.getCourses', context: context);

  @override
  Future<void> getCourses() {
    return _$getCoursesAsyncAction.run(() => super.getCourses());
  }

  @override
  String toString() {
    return '''
courses: ${courses},
isLoading: ${isLoading}
    ''';
  }
}
