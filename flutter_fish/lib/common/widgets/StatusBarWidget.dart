import 'dart:ui';
import 'package:flutter/material.dart';

class StatusBarWidget {
  static Widget get() {
    final double top = MediaQueryData.fromWindow(window).padding.top;
    return new Padding(padding: EdgeInsets.fromLTRB(0,top,0,0));
  }
}

