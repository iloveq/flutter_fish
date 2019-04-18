
import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_fish/common/constants/HttpConstants.dart';
import 'package:flutter_fish/common/network/HttpUtils.dart';

class HttpProxy {


  static Future<Response> getBannerList() async {
    return await HttpUtils.getInstance().req(HttpConstants.bannerList);
  }


}
