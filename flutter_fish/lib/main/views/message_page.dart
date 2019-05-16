import 'package:flutter/widgets.dart';
import 'package:flutter_fish/common/base/mvvm.dart';
import 'package:flutter_fish/common/base/page_state.dart';
import 'package:flutter_fish/main/vm/message_vm.dart';

class MessagePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => MessageState();
}


class MessageState extends BaseLoadingPageState<MessagePage> {

  var text = 'MessagePage';
  MessageViewModel vm;

  @override
  void preparedPage() {
    vm = ViewModelProvider().of(this, MessageViewModel());
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return new Center(
      child: new Text(text),
    );
  }

  @override
  void renderPage(Object o) {
    super.renderPage(o);
    vm.watcher.add("111",(data){
      this.text = data;
      this.setState(() {});
    });
    vm.setText();

  }



}