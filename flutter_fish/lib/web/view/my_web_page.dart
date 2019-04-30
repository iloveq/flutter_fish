import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_fish/common/styles/app_text.dart';

import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class MyWebPage extends StatefulWidget{

  final String _title;
  final String _url;
  MyWebPage(this._title, this._url);
  @override
  State<StatefulWidget> createState() => MyWebPageState(_title,_url);

}

class MyWebPageState extends State<MyWebPage>{

  final FlutterWebviewPlugin webPlugin;
  String _title;
  String _url;
  MyWebPageState(this._title,this._url):webPlugin = new FlutterWebviewPlugin();

  @override
  void initState() {
    super.initState();
    webPlugin.onStateChanged.listen((WebViewStateChanged state){
      switch(state.type){
        case WebViewState.shouldStart:
          break;
        case WebViewState.startLoad:
          break;
        case WebViewState.abortLoad:
          break;
        case WebViewState.finishLoad:
          break;
      }
    });

  }

  // 原生调用 js fun
  void callJsFun(String json){
    if(webPlugin==null)return;
    String method = "javascript:sendMsg('" + json + "')";
    webPlugin.evalJavascript(method);
  }



  @override
  Widget build(BuildContext context) {
    return new WebviewScaffold(
      url: _url,
      appBar: new AppBar(
        title: new Text(_title,
          style:AppText.titleText),
        centerTitle: true,
      ),
      withLocalStorage: true,
      withLocalUrl: true,
      scrollBar: false,
      withJavascript: true,
      withZoom: true,
      initialChild: new Center(
        child: Text("loading..."),
      ),
    );
  }


  @override
  void dispose() {
    super.dispose();
    webPlugin.dispose();
  }

}