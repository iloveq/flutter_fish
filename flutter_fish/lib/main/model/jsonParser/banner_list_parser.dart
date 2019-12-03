import 'dart:convert';



import 'package:flutter_fish/common/network/http_utils.dart';
import 'package:flutter_fish/main/model/bean/banner.dart';

class GetBannerListJsonParser extends JsonParser{
  @override
  parse(String str) {
    List<Banner> list = [];
    List bannerList = JsonCodec().decode(str);
    for (Map map in bannerList) {
      var banner = new Banner(map["title"], map["iconUrl"]);
      list.add(banner);
    }
    return list;
  }
}