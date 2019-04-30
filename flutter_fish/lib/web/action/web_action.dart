import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_fish/web/view/my_web_page.dart';

class EntryWebPageAction{

  static void go(BuildContext context,String fixTitle,String url){
    try {
      Navigator.of(context).push(new MaterialPageRoute(
          builder: (BuildContext context)=> MyWebPage(fixTitle,url)
      ));
    } catch (e) {}
  }

}