import 'package:dio/dio.dart';
import 'package:flutter_fish/common/network/RequestCtx.dart';

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
        connectTimeout: ctx.timeout,
        receiveTimeout: ctx.timeout,
        headers: ctx.headerMap,
        contentType: ctx.contentType,
        responseType: ctx.responseType);
    dio.transformer = ctx.transformer;
    dio.interceptors.addAll(ctx.interceptors);

    switch (ctx.method) {
      case "get":
        response = dio.get(ctx.url);
        break;
      case "post":
        response = dio.post(ctx.url, data: ctx.bodyMap);
        break;
    }

    return response;

  }

}


