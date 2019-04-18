import 'package:flutter/widgets.dart';

class RecommendGroupPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => RecommendGroupPageState();
}


class RecommendGroupPageState extends State<RecommendGroupPage> with AutomaticKeepAliveClientMixin {

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Text('RecommendGroupPage'),
    );
  }

  @override
  bool get wantKeepAlive => true;

}