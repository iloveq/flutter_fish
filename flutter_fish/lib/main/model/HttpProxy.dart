

import 'package:flutter_fish/common/network/HttpUtils.dart';
import 'package:flutter_fish/main/model/bean/Banner.dart';

class HttpProxy {

  static final String bannerList = "bannerList.json";


  static Future<List<Banner>> getBannerList() {
    return HttpUtils.get().req(bannerList,null);
  }


}
