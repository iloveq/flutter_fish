import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_fish/common/mvp/ILoadingView.dart';
import 'package:flutter_fish/common/utils/ToastUtils.dart';
import 'package:flutter_fish/common/widgets/LoadingDialog.dart';

abstract class BasePage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => getState();

  getState();

}

abstract class BasePageState<T extends StatefulWidget> extends State<T>{}

abstract class BaseLoadingPageState<T extends StatefulWidget>extends State<T> implements ILoadingView{

  var timer;
  ///*****************************************************/

  @override
  void closeLoading() {
    Navigator.pop(context);
  }

  @override
  void reload() {}

  @override
  void renderPage(Object o) {}

  @override
  void showDisconnect() {}

  @override
  void showError(String msg) {
    ToastUtils.show(msg);
  }

  @override
  void showLoading() {
    showDialog<Null>(
        context: context, //BuildContext对象
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new LoadingDialog( //调用对话框
            text: '正在获取详情...',
          );
        });

  }

  @mustCallSuper
  @override
  Widget build(BuildContext context) {
    timer = new Timer(new Duration(milliseconds: 1), () {
      onPageCreated();
    });
    return null;
  }

  @mustCallSuper
  @override
  void dispose() {
    super.dispose();
    if(timer!=null)
       timer.cancel();

  }

  void onPageCreated();

}