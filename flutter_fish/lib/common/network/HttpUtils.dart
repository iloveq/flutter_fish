import 'package:dio/dio.dart';
import 'package:flutter_fish/common/constants/HttpConstants.dart';
import 'package:flutter_fish/common/network/adapter/HAdapter.dart';
import 'package:flutter_fish/common/network/adapter/RequestCtx.dart';

class HttpUtils {

  static final HttpUtils _instance = new HttpUtils._internal();

  static HttpUtils getInstance() => _instance;

  factory HttpUtils() => _instance;

  HttpUtils._internal();

  req(String actionPath, {String method, Map<String, dynamic> body}) {
    try {
      RequestCtx ctx = new Builder()
          .setUrl(HttpConstants.serverAddress + actionPath)
          .setMethod(method)
          .setResponseType(ResponseType.bytes)
          .setBodyMap(body)
          .build();
      HAdapter.get().request(ctx);
    } catch (e) {
      print(e.toString());
    }
  }
}
