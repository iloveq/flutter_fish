
import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_fish/common/constants/http_constants.dart';
import 'package:flutter_fish/common/network/http_utils.dart';


import 'jsonParser/banner_list_parser.dart';

class HttpProxy {

  static Future<Response> getBannerList(DataCallback callback) async {
    return await HttpUtils.get().req(HttpConstants.bannerList,callback: callback,parser:GetBannerListJsonParser());
  }


}
