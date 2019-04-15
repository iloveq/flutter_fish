import 'package:flutter/widgets.dart';
import 'package:flutter_fish/common/widgets/PtrContainer.dart';

class GroupPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => GroupState();
}


class GroupState extends State<GroupPage> {


  var loadMoreListener = new OnLoadMoreListener();
  var refreshListener = new OnRefreshListener();

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new PtrContainer(
        new RefreshHeader(),
        new Container(),
        new LoadMoreFooter(),
        loadMoreListener,
        refreshListener
      ),
    );
  }

}