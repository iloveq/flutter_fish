import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_fish/common/utils/image_utils.dart';


import '../../third_libs_manager.dart';

class WelcomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => WelcomePageState();
}

class WelcomePageState extends State<WelcomePage> {

  final duration = new Duration(milliseconds: 1500);
  var timer;

  @override
  Widget build(BuildContext context) {
    /// 初始化屏幕适配
    ThirdLibsManager.get().adapterScreen(context);
    return new Scaffold(
        body:loadImageFullScreen(context,'images/welcome/init_cover.png')
    );
  }

  @override
  void initState() {
    super.initState();
    timer = new Timer(duration, () {
      try {
        Navigator.of(context)
            .pushNamedAndRemoveUntil('/index', (route) => false);
      } catch (e) {}
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

}
