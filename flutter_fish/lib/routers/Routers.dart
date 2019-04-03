import 'package:flutter/widgets.dart';
import 'package:flutter_fish/views/MainPage.dart';

class Routers{

  static Map<String,WidgetBuilder> configureRoutes() {
     return <String,WidgetBuilder>{
      '/index': (BuildContext context) => MainPage()
    };
  }

}