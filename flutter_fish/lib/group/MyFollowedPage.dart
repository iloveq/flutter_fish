import 'package:flutter/widgets.dart';

class MyFollowedPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyFollowedPageState();
}


class MyFollowedPageState extends State<MyFollowedPage> with AutomaticKeepAliveClientMixin{

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Text('MyFollowedPage'),
    );
  }

  @override
  bool get wantKeepAlive => true;

}