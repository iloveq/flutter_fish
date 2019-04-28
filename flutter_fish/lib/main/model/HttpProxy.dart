
import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_fish/common/constants/HttpConstants.dart';
import 'package:flutter_fish/common/network/core/HInterface.dart';
import 'package:flutter_fish/common/network/core/HttpUtils.dart';


import 'jsonParser/GetBannerListJsonParser.dart';

class HttpProxy {

  static Future<Response> getBannerList(DataCallback callback) async {
    return await HttpUtils.get().req(HttpConstants.bannerList,callback: callback,parser:GetBannerListJsonParser());
  }


}
