import 'dart:_http';

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

  Future<Response<dynamic>> request(RequestCtx ctx) {

    Future<Response<dynamic>> response;

    dio.options = new BaseOptions(
        connectTimeout: ctx.timeout == null ? HConstants.timeout : ctx.timeout,
        receiveTimeout: ctx.timeout == null ? HConstants.timeout : ctx.timeout,
        headers: ctx.headerMap,
        contentType: ctx.contentType == null ? ContentType.json : ctx.contentType,
        responseType: ctx.responseType == null ? ResponseType.json : ctx.responseType
    );

    if (ctx.transformer != null) {
      dio.transformer = ctx.transformer;
    }

    if (ctx.interceptors != null && ctx.interceptors.isNotEmpty) {
      dio.interceptors.addAll(ctx.interceptors);
    }

    switch (ctx.method) {
      case "get":
        response = dio.get(ctx.url);
        break;
      case "post":
        response = dio.post(ctx.url, data: ctx.bodyMap);
        break;
      default:
        response = dio.get(ctx.url);
    }

    return response;
  }
}
