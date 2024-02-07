// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chatViewModel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ChatViewModel on _ChatViewModel, Store {
  late final _$selectionAtom =
      Atom(name: '_ChatViewModel.selection', context: context);

  @override
  ChatType get selection {
    _$selectionAtom.reportRead();
    return super.selection;
  }

  @override
  set selection(ChatType value) {
    _$selectionAtom.reportWrite(value, super.selection, () {
      super.selection = value;
    });
  }

  late final _$_ChatViewModelActionController =
      ActionController(name: '_ChatViewModel', context: context);

  @override
  void setTypeChat(Set<ChatType> chatType) {
    final _$actionInfo = _$_ChatViewModelActionController.startAction(
        name: '_ChatViewModel.setTypeChat');
    try {
      return super.setTypeChat(chatType);
    } finally {
      _$_ChatViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selection: ${selection}
    ''';
  }
}
