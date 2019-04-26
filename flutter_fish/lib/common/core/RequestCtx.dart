import 'dart:io';

import 'HInterface.dart';


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
  dynamic _responseType;
  Map<String, dynamic> _paramMap;
  Map<String, dynamic> _headerMap;
  Map<String, dynamic> _bodyMap;
  int _retryCount;
  dynamic _transformer;
  List<dynamic> _interceptors;
  dataCallback _callback;
  JsonParser _parser;

  RequestCtx(final Builder builder) {
    this._url = builder.url;
    this._method = builder.method;
    this._timeout = builder.timeout;
    this._contentType = builder.contentType;
    this._responseType = builder.responseType;
    this._paramMap = builder.paramMap;
    this._headerMap = builder.headerMap;
    this._bodyMap = builder.bodyMap;
    this._retryCount = builder.retryCount;
    this._transformer = builder.transformer;
    this._interceptors = builder.interceptors;
    this._callback = builder.callback;
    this._parser = builder.parser;
  }

  String get url => _url;

  String get method => _method;

  int get timeout => _timeout;

  ContentType get contentType => _contentType;

  dynamic get responseType => _responseType;

  Map<String, dynamic> get paramMap => _paramMap;

  Map<String, dynamic> get headerMap => _headerMap;

  Map<String, dynamic> get bodyMap => _bodyMap;

  int get retryCount => _retryCount;

  dynamic get transformer => _transformer;

  List<dynamic> get interceptors => _interceptors;

  dataCallback get callback => _callback;

  JsonParser get parser => _parser;

}

class Builder {
  String url;
  String method;
  int timeout;
  ContentType contentType;
  dynamic responseType;
  Map<String, dynamic> paramMap;
  Map<String, dynamic> headerMap;
  Map<String, dynamic> bodyMap;
  int retryCount;
  dynamic transformer;
  List<dynamic> interceptors;
  dataCallback callback;
  JsonParser parser;

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

  Builder setResponseType(dynamic responseType) {
    this.responseType = responseType;
    return this;
  }

  Builder setParams(Map<String, dynamic> paramMap) {
    this.paramMap = paramMap;
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

  Builder setTransformer(dynamic transformer) {
    this.transformer = transformer;
    return this;
  }

  Builder setInterceptors(List<dynamic> interceptors) {
    this.interceptors = interceptors;
    return this;
  }

  Builder setDataCallback(dataCallback callback) {
    this.callback = callback;
    return this;
  }

  Builder setJsonParser(JsonParser parser) {
    this.parser = parser;
    return this;
  }

  RequestCtx build() {
    return new RequestCtx(this);
  }


}
