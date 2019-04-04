import 'package:flutter/widgets.dart';

class MessagePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => MessageState();
}


class MessageState extends State<MessagePage> {

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Text('MessagePage'),
    );
  }

}