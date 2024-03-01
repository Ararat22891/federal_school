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

  late final _$chatsAtom = Atom(name: '_ChatViewModel.chats', context: context);

  @override
  List<ChatCellModel> get chats {
    _$chatsAtom.reportRead();
    return super.chats;
  }

  @override
  set chats(List<ChatCellModel> value) {
    _$chatsAtom.reportWrite(value, super.chats, () {
      super.chats = value;
    });
  }

  late final _$isDataLoadedAtom =
      Atom(name: '_ChatViewModel.isDataLoaded', context: context);

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

  late final _$statusAtom =
      Atom(name: '_ChatViewModel.status', context: context);

  @override
  ChatStatus get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(ChatStatus value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  late final _$getChatListAsyncAction =
      AsyncAction('_ChatViewModel.getChatList', context: context);

  @override
  Future<void> getChatList() {
    return _$getChatListAsyncAction.run(() => super.getChatList());
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
selection: ${selection},
chats: ${chats},
isDataLoaded: ${isDataLoaded},
status: ${status}
    ''';
  }
}
