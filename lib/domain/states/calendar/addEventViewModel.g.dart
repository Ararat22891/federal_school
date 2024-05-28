// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'addEventViewModel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AddEventViewModel on _AddEventViewModel, Store {
  late final _$isLoadingDataAtom =
      Atom(name: '_AddEventViewModel.isLoadingData', context: context);

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

  late final _$selectedDateAtom =
      Atom(name: '_AddEventViewModel.selectedDate', context: context);

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

  late final _$timeAtom =
      Atom(name: '_AddEventViewModel.time', context: context);

  @override
  TimeOfDay? get time {
    _$timeAtom.reportRead();
    return super.time;
  }

  @override
  set time(TimeOfDay? value) {
    _$timeAtom.reportWrite(value, super.time, () {
      super.time = value;
    });
  }

  late final _$addEventAsyncAction =
      AsyncAction('_AddEventViewModel.addEvent', context: context);

  @override
  Future<void> addEvent() {
    return _$addEventAsyncAction.run(() => super.addEvent());
  }

  late final _$_AddEventViewModelActionController =
      ActionController(name: '_AddEventViewModel', context: context);

  @override
  String? validate(String? text) {
    final _$actionInfo = _$_AddEventViewModelActionController.startAction(
        name: '_AddEventViewModel.validate');
    try {
      return super.validate(text);
    } finally {
      _$_AddEventViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoadingData: ${isLoadingData},
selectedDate: ${selectedDate},
time: ${time}
    ''';
  }
}
