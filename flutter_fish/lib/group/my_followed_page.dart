import 'package:flutter/widgets.dart';
import 'package:flutter_fish/common/base/page_state.dart';

class MyFollowedPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyFollowedPageState();
}


class MyFollowedPageState extends BaseLoadingPageState<MyFollowedPage>{

  @override
  void preparedPage() {
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return new Center(
      child: new Text('MyFollowedPage'),
    );
  }





}