/// 负责 view - event -> model  model - event -> view

typedef event = Function(dynamic data);

class Watcher {
  Map<String, event> es;

  Watcher() {
    es = Map();
  }

  addEvent(String tag, event event) {
    es[tag] = event;
  }

  notify(String tag, dynamic data) {
    es[tag](data);
  }

  removeEvent(String tag) {
    es.remove(tag);
  }

  clear() {
    es.clear();
  }
}

/// viewModel 实现 action 接口 通过 viewModel.xxxFun() 使用 action
abstract class BaseViewModel<V> {
  Watcher _watcher;

  BaseViewModel() {
    this._watcher = new Watcher();
  }

  get watcher => this._watcher;

  clear() {
    _watcher.clear();
  }
}

class ViewModelProvider<T extends BaseViewModel> {

  static final ViewModelProvider _instance = new ViewModelProvider._internal();

  static ViewModelProvider get() => _instance;

  static of(dynamic widget, dynamic vm) =>
      _instance.save(widget, vm);

  factory ViewModelProvider() => _instance;

  ViewModelProvider._internal();

  final Map<int, T> _vmStore = new Map();

  save(dynamic widget, T vm) {
    if (_vmStore[vm.hashCode] != null) {
      _vmStore[vm.hashCode].clear();
    }
    _vmStore[vm.hashCode] = vm;
  }

  clear() {
    _vmStore.clear();
  }
}
