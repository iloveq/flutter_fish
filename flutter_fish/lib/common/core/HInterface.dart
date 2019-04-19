import 'dart:async';

import 'RequestCtx.dart';

abstract class JsonParser<T> {
    T parse(String str);
}

abstract class HAdapter{

    Future<dynamic> request(RequestCtx ctx);

}