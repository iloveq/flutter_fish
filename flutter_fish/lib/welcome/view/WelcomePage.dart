import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WelcomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => WelcomePageState();
}

class WelcomePageState extends State<WelcomePage> {

  final duration = new Duration(milliseconds: 1500);
  var timer;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Image.asset('images/init_cover.png',
            key: new Key('ivSplash'),
            fit: BoxFit.fill,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height
        )
    );
  }

  @override
  void initState() {
    super.initState();
    timer = new Timer(duration, () {
      try {
        Navigator.of(context)
            .pushNamedAndRemoveUntil('/index', (route) => route == null);
      } catch (e) {}
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

}
