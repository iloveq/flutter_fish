abstract class BasePresenter<T> {
  T view;

  BasePresenter(this.view);

  void start();

  void stop() {
    this.view = null;
  }
}
