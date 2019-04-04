import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_fish/common/utils/ImageUtils.dart';
import 'package:flutter_fish/main/views/GroupPage.dart';
import 'package:flutter_fish/main/views/HomePage.dart';
import 'package:flutter_fish/main/views/MessagePage.dart';
import 'package:flutter_fish/main/views/MinePage.dart';


class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MainPageState();
}

class MainPageState extends State<MainPage> with AutomaticKeepAliveClientMixin {
  int tabIndex = 0;
  var tabNames;
  var fragments;
  var tabImages;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: fragments[tabIndex],
      bottomNavigationBar: new CupertinoTabBar(
        items: <BottomNavigationBarItem>[
          new BottomNavigationBarItem(
              icon: getTabImage(0), title: getTabName(0)),
          new BottomNavigationBarItem(
              icon: getTabImage(1), title: getTabName(1)),
          new BottomNavigationBarItem(
              icon: getTabImage(2), title: getTabName(2)),
          new BottomNavigationBarItem(
              icon: getTabImage(3), title: getTabName(3)),
        ],
        currentIndex: tabIndex,
        onTap: (index) {
          setState(() {
            tabIndex = index;
          });
        },
      ),
    );
  }

  @override
  void initState() {
    tabNames = ['闲鱼', '鱼塘', '消息', '我的'];
    tabImages = [
      [
        getImage('images/main/ic_tabbar_home_nor.png'),
        getImage('images/main/ic_tabbar_home_sel.png')
      ],
      [
        getImage('images/main/ic_tabbar_group_nor.png'),
        getImage('images/main/ic_tabbar_group_sel.png')
      ],
      [
        getImage('images/main/ic_tabbar_message_nor.png'),
        getImage('images/main/ic_tabbar_message_sel.png')
      ],
      [
        getImage('images/main/ic_tabbar_my_nor.png'),
        getImage('images/main/ic_tabbar_my_sel.png')
      ]
    ];
    fragments = [
      new HomePage(),
      new GroupPage(),
      new MessagePage(),
      new MinePage()
    ];
    super.initState();
  }

  Text getTabName(int curIndex) {
    return new Text(tabNames[curIndex],
        style: new TextStyle(
            fontSize: 12.0, color: Color.fromRGBO(37, 37, 37, 100)));
  }

  Image getTabImage(int curIndex) {
    if (curIndex == tabIndex) {
      return tabImages[curIndex][1];
    }
    return tabImages[curIndex][0];
  }

  @override
  bool get wantKeepAlive => true;
}
