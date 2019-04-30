import 'package:flutter_fish/main/model/bean/banner.dart';

class HomeCtx {

  List<Banner> _bannerList;

  HomeCtx():_bannerList = [];

  List<Banner> get bannerList => _bannerList;

  set bannerList(List<Banner> bannerList) => this._bannerList = bannerList;

}
