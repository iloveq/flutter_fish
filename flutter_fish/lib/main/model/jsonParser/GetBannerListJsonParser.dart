import 'dart:convert';


import 'package:flutter_fish/common/network/core/HInterface.dart';
import 'package:flutter_fish/main/model/bean/Banner.dart';

class GetBannerListJsonParser extends JsonParser{
  @override
  parse(String str) {
    List<Banner> list = [];
    List<dynamic> jsonArray = JsonCodec().decode(str);
    for (Map map in jsonArray) {
      var banner = new Banner(map["title"], map["iconUrl"]);
      list.add(banner);
    }
    return list;
  }
}