import 'package:flutter/widgets.dart';
import 'package:flutter_fish/views/HomePage.dart';

class Routers{

  static Map<String,WidgetBuilder> configureRoutes() {
     return <String,WidgetBuilder>{
      '/homePage': (BuildContext context) => HomePage()
    };
  }

}