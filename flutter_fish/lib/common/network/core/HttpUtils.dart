import 'dart:async';

import 'HInterface.dart';
import 'RequestCtx.dart';

class HttpUtils{

  HAdapter _adapter;

  static final HttpUtils _instance = new HttpUtils._internal();

  static HttpUtils get() => _instance;

  factory HttpUtils() => _instance;

  HttpUtils._internal();

  setAdapter(HAdapter adapter){
    this._adapter = adapter;
  }

  Future<dynamic> req(String url, {String method,int timeout,
    Map<String, dynamic> header,
    Map<String, dynamic> params,
    Map<String, dynamic> body,
    dynamic responseType,
    dynamic transformer,
    List<dynamic> interceptors,
    DataCallback callback,
    JsonParser parser
    }) {
    assert(_adapter!=null);
    try {
      RequestCtx ctx = new Builder()
          .setUrl(url)
          .setMethod(method)
          .setHeaderMap(header)
          .setTimeout(timeout)
          .setParams(params)
          .setResponseType(responseType)
          .setBodyMap(body)
          .setTransformer(transformer)
          .setInterceptors(interceptors)
          .setDataCallback(callback)
          .setJsonParser(parser)
          .build();
      return _adapter.request(ctx);
      
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  String wrapUrlByParams(String url,Map<String, dynamic> params){
    String ret = url;
    if (params != null && params is Map && params.isNotEmpty) {
      StringBuffer sb = new StringBuffer("?");
      params.forEach((key, value) {
        sb.write("$key" + "=" + "$value" + "&");
      });
      String paramStr = sb.toString();
      paramStr = paramStr.substring(0, paramStr.length - 1);
      ret += paramStr;
    }
    return ret;
  }

}



