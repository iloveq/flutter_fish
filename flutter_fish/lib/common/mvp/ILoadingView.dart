import 'package:flutter_fish/common/mvp/IView.dart';

class ILoadingView extends IView{

  void showLoading({String msg}){}

  void closeLoading(){}

  void renderPage(Object o){}

  void reload(){}

  void showError({String msg}){}

  void showDisconnect(){}

}