import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_fish/main/contract/HomeContract.dart';
import 'package:flutter_fish/main/model/wrapper/HomeCtx.dart';
import 'package:flutter_fish/main/presenter/HomePresenter.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageState();
}

/// **************************************************************/

class HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin implements View {
  HomePresenter presenter;
  HomeCtx homeCtx = new HomeCtx([]);

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: homeCtx.bannerList.length,
        itemBuilder: (context, index) {
          return new ListTile(
            title: new Text(homeCtx.bannerList.elementAt(index).getTitle()),
          );
        });
  }

  @override
  void initState() {
    super.initState();
    presenter = new HomePresenter(this);
    presenter.getBannerList();
  }

  @override
  void dispose() {
    super.dispose();
    presenter.stop();
  }

  @override
  void closeLoading() {
  }

  @override
  void reload() {
  }

  @override
  void renderPage(Object o) {
    this.homeCtx.bannerList = o;
    setState(() {});
  }

  @override
  void showDisconnect() {
  }

  @override
  void showError(String msg) {
  }

  @override
  void showLoading() {
  }

  @override
  bool get wantKeepAlive => true;
}
