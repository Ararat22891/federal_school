import 'package:mobx/mobx.dart';

part 'chatViewModel.g.dart';

class ChatViewModel = _ChatViewModel with _$ChatViewModel;

enum ChatType { message, group }


abstract class _ChatViewModel with Store {

  @observable
  ChatType selection = ChatType.message;

  @action
  void setTypeChat(Set<ChatType> chatType){
    selection = chatType.first;
  }

}