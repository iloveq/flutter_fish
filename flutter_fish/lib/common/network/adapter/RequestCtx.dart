import 'dart:_http';

import 'package:dio/dio.dart';

class HConstants {
  static final String get = "get";
  static final String post = "post";
  static final int timeout = 15000;
}

class RequestCtx {
  String _url;
  String _method;
  int _timeout;
  ContentType _contentType;
  ResponseType _responseType;
  Map<String, dynamic> _headerMap;
  Map<String, dynamic> _bodyMap;
  int _retryCount;
  Transformer _transformer;
  List<Interceptor> _interceptors;

  RequestCtx(final Builder builder) {
    this._url = builder.url;
    this._method = builder.method;
    this._timeout = builder.timeout;
    this._contentType = builder.contentType;
    this._responseType = builder.responseType;
    this._headerMap = builder.headerMap;
    this._bodyMap = builder.bodyMap;
    this._retryCount = builder.retryCount;
    this._transformer = builder.transformer;
    this._interceptors = builder.interceptors;
  }

  String get url => _url;

  String get method => _method;

  int get timeout => _timeout;

  ContentType get contentType => _contentType;

  ResponseType get responseType => _responseType;

  Map<String, dynamic> get headerMap => _headerMap;

  Map<String, dynamic> get bodyMap => _bodyMap;

  int get retryCount => _retryCount;

  Transformer get transformer => _transformer;

  List<Interceptor> get interceptors => _interceptors;
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
