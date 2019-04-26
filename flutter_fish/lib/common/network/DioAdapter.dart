import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_fish/common/core/HInterface.dart';
import 'package:flutter_fish/common/core/HttpUtils.dart';
import 'package:flutter_fish/common/core/RequestCtx.dart';

class DioAdapter implements HAdapter{

  Dio _dio;
  bool _isLoadedOption = false;

  DioAdapter() {
    _dio = new Dio();
  }

  @override
  Future<Response<dynamic>> request(RequestCtx ctx) async {

    Future<Response<dynamic>> response;

    if(!_isLoadedOption){
      _dio.options = new BaseOptions(
          connectTimeout: ctx.timeout == null ? HConstants.timeout : ctx.timeout,
          receiveTimeout: ctx.timeout == null ? HConstants.timeout : ctx.timeout,
          headers: ctx.headerMap==null?{HttpHeaders.userAgentHeader: "dio-2.1.0"}:ctx.headerMap,
          contentType: ctx.contentType == null ? ContentType.json : ctx.contentType,
          responseType: ctx.responseType == null ? ResponseType.plain : ctx.responseType,
          validateStatus: (status) {
            return status >= 200 && status < 300 || status == 304;
          }
      );
      _isLoadedOption = true;
    }


    if (ctx.transformer != null) {
      _dio.transformer = ctx.transformer;
    }

    if (ctx.interceptors != null && ctx.interceptors.isNotEmpty) {
      for (var value in ctx.interceptors) {
        _dio.interceptors.add(value);
      }
    }

    String url = HttpUtils.get().wrapUrlByParams(ctx.url, ctx.paramMap);

    switch (ctx.method) {
      case "get":
        response = _dio.get(url);
        break;
      case "post":
        response = _dio.post(url, data: ctx.bodyMap);
        break;
      default:
        response = _dio.get(url);
    }

    if(ctx.callback!=null&&ctx.parser!=null){
      response.then((response){
        // can by some response.statusCode to make some regex
        ctx.callback(HState.success,ctx.parser.parse(response.data));
      }).catchError((e){
        ctx.callback(HState.fail,e);
      });
    }else{
      throw Exception('callback must be with a parser');
    }

    return response;
  }
}
