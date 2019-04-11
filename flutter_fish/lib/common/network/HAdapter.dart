import 'dart:io';

import 'package:dio/dio.dart';

class HAdapter {
  Dio dio;

  static final HAdapter instance = new HAdapter._internal();

  static HAdapter get() => instance;

  factory HAdapter() => instance;

  HAdapter._internal() {
    dio = new Dio();
  }

  Future<Response<dynamic>> request(RequestCtx ctx) {

    Future<Response<dynamic>> response;

    dio.options = new BaseOptions(
        connectTimeout: ctx.getTimeout(),
        receiveTimeout: ctx.getTimeout(),
        headers: ctx.getHeaderMap(),
        contentType: ctx.getContentType(),
        responseType: ctx.getResponseType());
    dio.transformer = ctx.getTransformer();
    dio.interceptors.addAll(ctx.getInterceptors());

    switch (ctx.getMethod()) {
      case "get":
        response = dio.get(ctx.getUrl());
        break;
      case "post":
        response = dio.post(ctx.getUrl(), data: ctx.getBodyMap());
        break;
    }

    return response;

  }

}

class HConstants {
  static final String get = "get";
  static final String post = "post";
}

class RequestCtx {
  String url;
  String method;
  int timeout;
  ContentType contentType;
  ResponseType responseType;
  Map<String, dynamic> headerMap;
  Map<String, dynamic> bodyMap;
  int retryCount;
  Transformer transformer;
  List<Interceptor> interceptors;

  RequestCtx(Builder builder) {
    this.url = builder.url;
    this.method = builder.method;
    this.timeout = builder.timeout;
    this.contentType = builder.contentType;
    this.responseType = builder.responseType;
    this.headerMap = builder.headerMap;
    this.bodyMap = builder.bodyMap;
    this.retryCount = builder.retryCount;
    this.transformer = builder.transformer;
    this.interceptors = builder.interceptors;
  }

  String getUrl() {
    return url;
  }

  String getMethod() {
    return method;
  }

  int getTimeout() {
    return timeout;
  }

  ContentType getContentType() {
    return contentType;
  }

  ResponseType getResponseType() {
    return responseType;
  }

  Map<String, dynamic> getHeaderMap() {
    return headerMap;
  }

  Map<String, dynamic> getBodyMap() {
    return bodyMap;
  }

  int getRetryCount() {
    return retryCount;
  }

  Transformer getTransformer() {
    return transformer;
  }

  List<Interceptor> getInterceptors() {
    return interceptors;
  }
}

class Builder {
  String url;
  String method;
  int timeout;
  ContentType contentType;
  ResponseType responseType;
  Map<String, dynamic> headerMap;
  Map<String, dynamic> bodyMap;
  int retryCount;
  Transformer transformer;
  List<Interceptor> interceptors;

  Builder setUrl(String url) {
    this.url = url;
    return this;
  }

  Builder setMethod(String method) {
    this.method = method;
    return this;
  }

  Builder setTimeout(int timeout) {
    this.timeout = timeout;
    return this;
  }

  Builder setContentType(ContentType contentType) {
    this.contentType = contentType;
    return this;
  }

  Builder setResponseType(ResponseType responseType) {
    this.responseType = responseType;
    return this;
  }

  Builder setHeaderMap(Map<String, dynamic> headerMap) {
    this.headerMap = headerMap;
    return this;
  }

  Builder setBodyMap(Map<String, dynamic> bodyMap) {
    this.bodyMap = bodyMap;
    return this;
  }

  Builder setRetryCount(int retryCount) {
    this.retryCount = retryCount;
    return this;
  }

  Builder setTransformer(Transformer transformer) {
    this.transformer = transformer;
    return this;
  }

  Builder setInterceptors(List<Interceptor> interceptors) {
    this.interceptors = interceptors;
    return this;
  }

  RequestCtx build() {
    return new RequestCtx(this);
  }
}
