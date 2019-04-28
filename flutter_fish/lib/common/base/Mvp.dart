
class IView{}

class IPresenter{}

abstract class BasePresenter<T> {
  T view;

  BasePresenter(this.view);

  void start();

  void stop() {
    this.view = null;
  }
}


class ILoadingView extends IView{

  void showLoading({String msg}){}

  void closeLoading(){}

  void renderPage(Object o){}

  void reload(){}

  void showError({String msg}){}

  void showDisconnect(){}

}

class ILoadingListView extends ILoadingView{

  void showEmpty(){}

}