
import 'package:dio/dio.dart';
import 'package:flutter_fish/common/constants/HttpConstants.dart';
import 'package:flutter_fish/common/network/HttpUtils.dart';
import 'package:flutter_fish/main/model/bean/Banner.dart';

class HttpProxy {


  static Future<Response<Null>> getBannerList() async {
    return await HttpUtils.getInstance().req(HttpConstants.bannerList);
  }


}
