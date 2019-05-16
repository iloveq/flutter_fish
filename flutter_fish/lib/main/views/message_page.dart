import 'package:flutter/widgets.dart';
import 'package:flutter_fish/common/base/mvvm.dart';
import 'package:flutter_fish/common/base/page_state.dart';
import 'package:flutter_fish/main/vm/message_vm.dart';

class MessagePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => MessageState();
}


class MessageState extends BaseLoadingPageState<MessagePage> {

  var text = 'click it !';
  MessageViewModel vm;

  @override
  void initState() {
    super.initState();
    ViewModelProvider().of(this,vm= MessageViewModel());
  }

  @override
  void preparedPage() {

  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return new Center(
      child: GestureDetector(
        onTap: (){
          vm.watcher.addEvent("111",(data){
            this.text = data;
            this.setState(() {});
          });
          vm.setText();
        },
        child: new Text(text),
      ),
    );
  }

  @override
  void renderPage(Object o) {
    super.renderPage(o);


  }



}