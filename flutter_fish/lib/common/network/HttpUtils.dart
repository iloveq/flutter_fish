import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_fish/common/constants/HttpConstants.dart';

class HttpUtils{

  Dio dio;

  static final HttpUtils instance = new HttpUtils._internal();
  factory HttpUtils() => instance;

  HttpUtils._internal(){
    dio =new Dio(new BaseOptions(
      baseUrl: HttpConstants.serverAddress,
      connectTimeout: 5000,
      receiveTimeout: 100000,
      headers: {
        HttpHeaders.userAgentHeader: "dio",
        "api": "1.0.0",
      },
      contentType: ContentType.json,
      // Transform the response data to a String encoded with UTF8.
      // The default value is [ResponseType.JSON].
      responseType: ResponseType.plain,
    ));
  }


  void request(){

  }






}

class RequestConstants{

}



class RequestCtx{

  final String url;
  final String methodType;
  final int timeout;
  final String contentType;
  final String responseType;
  final Map<String,dynamic> headerMap;
  final Map<String,dynamic> bodyMap;
  final int retryCount;

  RequestCtx(
      this.url,
      this.methodType,
      this.timeout,
      this.contentType,
      this.responseType,
      this.headerMap,
      this.bodyMap,
      this.retryCount
      );

  


}