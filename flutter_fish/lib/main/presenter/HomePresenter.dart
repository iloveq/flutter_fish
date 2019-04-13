import 'package:dio/dio.dart';
import 'package:flutter_fish/common/mvp/BasePresenter.dart';
import 'package:flutter_fish/main/contract/HomeContract.dart';
import 'package:flutter_fish/main/model/HttpProxy.dart';
import 'package:flutter_fish/main/model/bean/Banner.dart';

class HomePresenter extends BasePresenter<View> implements Presenter {

  HomePresenter(View view) : super(view);

  @override
  void start() {}

  @override
  void getBannerList() {
    HttpProxy.getBannerList().then((Response<Object> bannerList) {
      //view.renderPage(bannerList);
      print(bannerList.data);
    }).catchError((e) => view.showError(e.toString()));
  }

}
