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

class HomePageState extends State<HomePage> implements View {
  HomePresenter presenter;
  HomeCtx homeCtx = new HomeCtx([]);

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: homeCtx.getBannerList().length,
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
    // TODO: implement closeLoading
  }

  @override
  void reload() {
    // TODO: implement reload
  }

  @override
  void renderPage(Object o) {
    setState(() {
      this.homeCtx = o;
    });
  }

  @override
  void showDisconnect() {
    // TODO: implement showDisconnect
  }

  @override
  void showError(String msg) {
    // TODO: implement showError
  }

  @override
  void showLoading() {
    // TODO: implement showLoading
  }
}
