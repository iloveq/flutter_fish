import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_fish/common/network/adapter/RequestCtx.dart';

class HAdapter {
  Dio dio;

  static final HAdapter _instance = new HAdapter._internal();

  static HAdapter get() => _instance;

  factory HAdapter() => _instance;

  HAdapter._internal() {
    dio = new Dio();
  }

  Future<Response<dynamic>> request(RequestCtx ctx) async {

    Future<Response<dynamic>> response;

    dio.options = new BaseOptions(
        connectTimeout: ctx.timeout == null ? HConstants.timeout : ctx.timeout,
        receiveTimeout: ctx.timeout == null ? HConstants.timeout : ctx.timeout,
        headers: ctx.headerMap==null?{HttpHeaders.userAgentHeader: "HAdapter"}:ctx.headerMap,
        contentType: ctx.contentType == null ? ContentType.json : ctx.contentType,
        responseType: ctx.responseType == null ? ResponseType.json : ctx.responseType,
        validateStatus: (status) {
          return status >= 200 && status < 300 || status == 304;
        }
    );

    if (ctx.transformer != null) {
      dio.transformer = ctx.transformer;
    }

    if (ctx.interceptors != null && ctx.interceptors.isNotEmpty) {
      dio.interceptors.addAll(ctx.interceptors);
    }

    String url;

    if (ctx.paramMap != null && ctx.paramMap is Map && ctx.paramMap.isNotEmpty) {
      StringBuffer sb = new StringBuffer("?");
      ctx.paramMap.forEach((key, value) {
        sb.write("$key" + "=" + "$value" + "&");
      });
      String paramStr = sb.toString();
      paramStr = paramStr.substring(0, paramStr.length - 1);
      url += paramStr;
    }else{
      url=ctx.url;
    }

    switch (ctx.method) {
      case "get":
        response = dio.get(url);
        break;
      case "post":
        response = dio.post(ctx.url, data: ctx.bodyMap);
        break;
      default:
        response = dio.get(url);
    }

    return response;
  }
}
