import 'package:flutter_fish/common/mvp/IModel.dart';
import 'package:flutter_fish/common/mvp/IPresenter.dart';
import 'package:flutter_fish/common/mvp/IView.dart';

class BasePresenter<T extends IView, M extends IModel>
    implements IPresenter<T> {

  T view;
  M model;

  BasePresenter();

  @override
  void onAttach(T t) {
    this.view = t;
  }

  @override
  void onDetach() {
    this.view = null;
    this.model=null;
  }
}
