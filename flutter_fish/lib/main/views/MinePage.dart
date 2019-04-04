import 'package:flutter/widgets.dart';

class MinePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => MineState();
}


class MineState extends State<MinePage> {

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Text('MinePage'),
    );
  }

}