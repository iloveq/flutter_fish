import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_fish/common/constants/HttpConstants.dart';
import 'package:flutter_fish/common/network/adapter/HAdapter.dart';
import 'package:flutter_fish/common/network/adapter/RequestCtx.dart';

class HttpUtils{

  static final HttpUtils _instance = new HttpUtils._internal();

  static HttpUtils getInstance() => _instance;

  factory HttpUtils() => _instance;

  HttpUtils._internal();

  Future<Response> req(String actionPath, {String method,int timeout,
    Map<String, dynamic> header,
    Map<String, dynamic> params,
    Map<String, dynamic> body,
    Transformer transformer,
    List<Interceptor> interceptors}) {
    try {
      RequestCtx ctx = new Builder()
          .setUrl(HttpConstants.serverAddress + actionPath)
          .setMethod(method)
          .setHeaderMap(header)
          .setTimeout(timeout)
          .setParams(params)
          .setResponseType(ResponseType.plain)
          .setBodyMap(body)
          .setTransformer(transformer)
          .setInterceptors(interceptors)
          .build();
      return HAdapter.get().request(ctx);
      
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }
}
