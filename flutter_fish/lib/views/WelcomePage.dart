import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_fish/views/HomePage.dart';

class WelcomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => WelcomePageState();
}

class WelcomePageState extends State<WelcomePage> {

  Duration duration = new Duration(milliseconds: 1500);
  Timer timer;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Image.asset('images/init_cover.png',key:new Key('ivSplash') ),
    );
  }


  @override
  void initState() {
    super.initState();
    timer = new Timer(duration, (){
      try {
           Navigator.of(context).pushNamedAndRemoveUntil('/homePage', (route) => route == null);
      } catch (e) {
      }
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

}