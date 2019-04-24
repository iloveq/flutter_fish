import 'dart:async';

import 'RequestCtx.dart';

abstract class JsonParser<T> {
  T parse(String jsonStr);
}

abstract class HAdapter {
  Future<dynamic> request(RequestCtx ctx);
}

// a transformer
typedef transformer = String Function(String original);

// a callback
typedef dataCallback = Function(int state, dynamic data);

class HState{
  static final int success = 1;//成功
  static final int fail = 0;//失败
  static final int intercept = -1;//中断
}

class HResType{
  static final int json = 1;
  static final int string = 2;
  static final int byte = 3;
}