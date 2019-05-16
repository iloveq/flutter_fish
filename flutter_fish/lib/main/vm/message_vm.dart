import 'package:flutter_fish/common/base/mvvm.dart';
import 'package:flutter_fish/main/contract/message_events.dart';
import 'package:flutter_fish/main/views/message_page.dart';


class MessageViewModel extends BaseViewModel<MessageState> implements MessageEvents{

  MessageViewModel();

  @override
  setText() {
    watcher.notify("setText","666");
  }










}