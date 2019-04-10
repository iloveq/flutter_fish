import 'package:flutter_fish/main/model/bean/Banner.dart';

class HomeCtx{

  List<Banner> bannerList;

  HomeCtx(this.bannerList);

  List<Banner> getBannerList(){
    return bannerList;
  }


}