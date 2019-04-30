import 'dart:convert';



import 'package:flutter_fish/common/network/http_utils.dart';
import 'package:flutter_fish/main/model/bean/banner.dart';

class GetBannerListJsonParser extends JsonParser{
  @override
  parse(String str) {
    List<Banner> list = [];
    Map map = JsonCodec().decode(str);
    for (Map map in map["bannerList"]) {
      var banner = new Banner(map["title"], map["iconUrl"]);
      list.add(banner);
    }
    return list;
  }
}