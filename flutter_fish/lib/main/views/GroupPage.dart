import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_fish/common/widgets/PtrContainer.dart';

class GroupPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => GroupState();
}

class GroupState extends State<GroupPage> {
  var loadMoreListener = new OnLoadMoreListener();
  var refreshListener = new OnRefreshListener();

  List<String> list = ["zhangsan", "lisi", "wangwu"];




  Widget getBody(){
    return  new ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return new ListTile(
            title: new Text(list[index]),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return new Center(
       child: new PtrContainer(
          header: new Container(
            child: new Text("header"),
          ),
          body: getBody(),
          footer: new Container(
            child: new Text("footer"),
          ),
          loadMoreListener: loadMoreListener,
          refreshListener: refreshListener,
        )
    );
  }
}
