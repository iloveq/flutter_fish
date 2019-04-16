import 'package:flutter/widgets.dart';
import 'package:flutter_fish/main/views/MainPage.dart';
import 'package:flutter_fish/welcome/view/WelcomePage.dart';

class Routers {
  static Map<String, WidgetBuilder> configureRoutes() {
    return <String, WidgetBuilder>{
      '/': (BuildContext context) => WelcomePage(),
      '/index': (BuildContext context) => MainPage()
    };
  }
}
