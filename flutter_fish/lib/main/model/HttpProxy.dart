
import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_fish/common/constants/HttpConstants.dart';
import 'package:flutter_fish/common/core/HttpUtils.dart';

class HttpProxy {


  static Future<Response> getBannerList() async {
    return await HttpUtils.get().req(HttpConstants.bannerList);
  }


}
