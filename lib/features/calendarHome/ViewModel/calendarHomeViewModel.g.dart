// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendarHomeViewModel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CalendarHomeViewModel on _CalendarHomeViewModel, Store {
  late final _$controllerAtom =
      Atom(name: '_CalendarHomeViewModel.controller', context: context);

  @override
  ScrollController get controller {
    _$controllerAtom.reportRead();
    return super.controller;
  }

  @override
  set controller(ScrollController value) {
    _$controllerAtom.reportWrite(value, super.controller, () {
      super.controller = value;
    });
  }

  late final _$focusedDateAtom =
      Atom(name: '_CalendarHomeViewModel.focusedDate', context: context);

  @override
  DateTime get focusedDate {
    _$focusedDateAtom.reportRead();
    return super.focusedDate;
  }

  @override
  set focusedDate(DateTime value) {
    _$focusedDateAtom.reportWrite(value, super.focusedDate, () {
      super.focusedDate = value;
    });
  }

  late final _$maxExtentAtom =
      Atom(name: '_CalendarHomeViewModel.maxExtent', context: context);

  @override
  double get maxExtent {
    _$maxExtentAtom.reportRead();
    return super.maxExtent;
  }

  @override
  set maxExtent(double value) {
    _$maxExtentAtom.reportWrite(value, super.maxExtent, () {
      super.maxExtent = value;
    });
  }

  late final _$calendarFormatAtom =
      Atom(name: '_CalendarHomeViewModel.calendarFormat', context: context);

  @override
  CalendarFormat get calendarFormat {
    _$calendarFormatAtom.reportRead();
    return super.calendarFormat;
  }

  @override
  set calendarFormat(CalendarFormat value) {
    _$calendarFormatAtom.reportWrite(value, super.calendarFormat, () {
      super.calendarFormat = value;
    });
  }

  late final _$_CalendarHomeViewModelActionController =
      ActionController(name: '_CalendarHomeViewModel', context: context);

  @override
  void onDaySelect(DateTime selecteDay, DateTime focusedDay) {
    final _$actionInfo = _$_CalendarHomeViewModelActionController.startAction(
        name: '_CalendarHomeViewModel.onDaySelect');
    try {
      return super.onDaySelect(selecteDay, focusedDay);
    } finally {
      _$_CalendarHomeViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
controller: ${controller},
focusedDate: ${focusedDate},
maxExtent: ${maxExtent},
calendarFormat: ${calendarFormat}
    ''';
  }
}
