import 'package:dio/dio.dart';
import 'package:flutter_fish/common/mvp/BasePresenter.dart';
import 'package:flutter_fish/main/contract/HomeContract.dart';
import 'package:flutter_fish/main/model/HttpProxy.dart';
import 'package:flutter_fish/main/model/bean/Banner.dart';
import 'package:flutter_fish/main/model/jsonParser/GetBannerListJsonParser.dart';

class HomePresenter extends BasePresenter<View> implements Presenter {
  HomePresenter(View view) : super(view);

  @override
  void start() {}

  @override
  void getBannerList(){
    view.showLoading();
    HttpProxy.getBannerList().then((Response res) {
      view.closeLoading();
      List<Banner> bannerList =
          new GetBannerListJsonParser().parse(res.data);
      view.renderPage(bannerList);
    }).catchError((e) {
      view.closeLoading();
      view.showError(e.toString());
    });
  }
}
