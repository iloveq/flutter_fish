import 'package:flutter/widgets.dart';
import 'package:flutter_fish/common/base/page_state.dart';

class MessagePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => MessageState();
}


class MessageState extends BaseLoadingPageState<MessagePage> {

  @override
  void preparedPage() {
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return new Center(
      child: new Text('MessagePage'),
    );
  }




}