import 'package:flutter/material.dart';
import 'package:flutter_fish/Application.dart';
import 'package:flutter_fish/routers/Routers.dart';
import 'package:flutter_fish/welcome/view/WelcomePage.dart';


void main() {
  new Application().onCreate();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WelcomePage(),
      routes: Routers.configureRoutes(),
    );
  }
}


