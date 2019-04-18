import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_fish/web/view/MyWebPage.dart';

class EntryWebPageAction{

  static void entry(BuildContext context,String fixTitle,String url){
    try {
      Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context){
        return MyWebPage(fixTitle,url);
      }));
    } catch (e) {}
  }

}