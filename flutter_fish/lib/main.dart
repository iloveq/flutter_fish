import 'package:flutter/material.dart';
import 'package:flutter_fish/third_libs_manager.dart';
import 'package:flutter_fish/router/my_router.dart';


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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: Routers.configureRoutes(),
    );
  }

  @override
  void dispose() {
    super.dispose();
    ThirdLibsManager.get().release();
  }

}
