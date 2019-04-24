import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_fish/common/mvp/ILoadingView.dart';
import 'package:flutter_fish/common/utils/ToastUtils.dart';
import 'package:flutter_fish/common/widgets/LoadingDialog.dart';

abstract class BasePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => getState();
  getState();
}

abstract class BasePageState<T extends StatefulWidget> extends State<T> {

  bool _isPrepared = false;

  ///*****************************************************/

  @mustCallSuper
  @override
  Widget build(BuildContext context) {
    if (!_isPrepared) {
      Timer.run(() => preparedPage());
      _isPrepared = true;
    }
    return null;
  }

  @mustCallSuper
  @override
  void dispose() {
    super.dispose();
  }

  /// to init once ,use timer make build completed to avoid dialog can get context
  void preparedPage();

}

///*****************************************************/

abstract class BaseLoadingPageState<T extends StatefulWidget> extends BasePageState<T>
    implements ILoadingView {

  @override
  void reload() {}

  @override
  void renderPage(Object o) {}

  @override
  void showDisconnect() {}

  @override
  void showError({String msg}) {
    if(msg!=null) {
      ToastUtils.show(msg);
    }
  }

  @override
  void showLoading({String msg}) {
    /// make dialog split from build that avoid to much dependence of a simple page
    showDialog<Null>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new LoadingDialog(
            //调用对话框
            text: msg==null?'加载中...':msg,
          );
        });
  }


  @override
  void closeLoading() {
    /// must dialog be showed , if not can make page to pop
    Navigator.pop(context);
  }


}
