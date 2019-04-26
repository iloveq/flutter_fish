
import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_fish/common/constants/HttpConstants.dart';
import 'package:flutter_fish/common/core/HInterface.dart';
import 'package:flutter_fish/common/core/HttpUtils.dart';

import 'jsonParser/GetBannerListJsonParser.dart';

class HttpProxy {

  static Future<Response> getBannerList(dataCallback callback) async {
    return await HttpUtils.get().req(HttpConstants.bannerList,callback: callback,parser:GetBannerListJsonParser());
  }


}
