import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_fish/common/base/BasePage.dart';
import 'package:flutter_fish/main/contract/HomeContract.dart';
import 'package:flutter_fish/main/model/wrapper/HomeCtx.dart';
import 'package:flutter_fish/main/presenter/HomePresenter.dart';


class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageState();
}

/// **************************************************************/

class HomePageState extends BaseLoadingPageState<HomePage> implements View{

  HomePresenter presenter;
  HomeCtx homeCtx;

  @override
  void initState() {
    super.initState();
    homeCtx = new HomeCtx();
    presenter = new HomePresenter(this);
  }

  @override
  void preparedPage() {
    presenter.getBannerList();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return new ListView.builder(
        itemCount: homeCtx.bannerList.length,
        itemBuilder: (context, index) {
          return new ListTile(
            title: new Text(homeCtx.bannerList.elementAt(index).getTitle()),
          );
        });
  }


  @override
  void dispose() {
    super.dispose();
    presenter.stop();
  }

  @override
  void renderPage(Object o) {
    this.homeCtx.bannerList = o;
    setState(() {});
  }


}
