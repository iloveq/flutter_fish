import 'package:flutter/widgets.dart';
import 'package:flutter_fish/main/views/main_page.dart';
import 'package:flutter_fish/welcome/view/welcome_page.dart';

class Routers {
  static Map<String, WidgetBuilder> configureRoutes() {
    return <String, WidgetBuilder>{
      '/': (BuildContext context) => WelcomePage(),
      '/index': (BuildContext context) => MainPage()
    };
  }
}
