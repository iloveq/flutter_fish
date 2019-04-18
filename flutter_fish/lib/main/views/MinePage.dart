import 'package:flutter/widgets.dart';

class MinePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => MineState();
}


class MineState extends State<MinePage> with AutomaticKeepAliveClientMixin {

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Text('MinePage'),
    );
  }

  @override
  bool get wantKeepAlive => true;

}