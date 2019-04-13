import 'package:flutter/material.dart';
import 'package:flutter_fish/ThridLibsManager.dart';
import 'package:flutter_fish/routers/Routers.dart';
import 'package:flutter_fish/welcome/view/WelcomePage.dart';

void main() {
  ThirdLibsManager.get().setup();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
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

  @override
  void dispose() {
    super.dispose();
    ThirdLibsManager.get().release();
  }

}
