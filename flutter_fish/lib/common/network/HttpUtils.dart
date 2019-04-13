import 'package:dio/dio.dart';
import 'package:flutter_fish/common/constants/HttpConstants.dart';
import 'package:flutter_fish/common/network/HAdapter.dart';
import 'package:flutter_fish/common/network/RequestCtx.dart';

class HttpUtils {

  static final HttpUtils _instance = new HttpUtils._internal();

  static HttpUtils get() => _instance;

  factory HttpUtils() => _instance;

  HttpUtils._internal();

  req(String actionPath,Map<String,dynamic> body) {
    try {
      RequestCtx ctx = new Builder()
          .setUrl(HttpConstants.serverAddress + actionPath)
          .setMethod(HConstants.get)
          .setResponseType(ResponseType.json)
          .setBodyMap(body)
          .build();
      HAdapter.get().request(ctx);
    } catch (e) {
      print(e.toString());
    }
  }

}
