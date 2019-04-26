import 'package:flutter/widgets.dart';
import 'package:flutter_fish/common/base/BasePage.dart';

class MinePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => MineState();
}


class MineState extends BaseLoadingPageState<MinePage> {

  @override
  void preparedPage() {
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return new Center(
      child: new Text('MinePage'),
    );
  }


}