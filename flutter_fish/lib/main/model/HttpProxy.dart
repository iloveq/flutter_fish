
import 'package:flutter_fish/common/constants/HttpConstants.dart';
import 'package:flutter_fish/common/network/HttpUtils.dart';
import 'package:flutter_fish/main/model/bean/Banner.dart';

class HttpProxy {


  static Future<List<Banner>> getBannerList() {
    return HttpUtils.getInstance().req(HttpConstants.bannerList);
  }


}
