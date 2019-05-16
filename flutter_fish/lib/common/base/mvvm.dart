
/// 负责 view - event -> model  model - event -> view

typedef onChange = Function(dynamic data);


class Watcher{

    Map<String,onChange> es;

    Watcher(){
      es = Map();
    }

    addEvent(String tag,onChange event){
       es[tag]=event;
    }

    notify(String tag,dynamic data){
      es[tag](data);
    }

    removeEvent(String tag){
      es.remove(tag);
    }

    clear(){
      es.clear();
    }

}

/// viewModel 实现 action 接口 通过 viewModel.xxxFun() 使用 action
abstract class BaseViewModel<V> {

  Watcher _watcher;

  BaseViewModel():this._watcher=new Watcher();

  get watcher => this._watcher;

  clear(){
    _watcher.clear();
  }

}


class ViewModelProvider<T extends BaseViewModel>{

  T _vm;
  final Map<int,T> _vmStore = new Map();

  ViewModelProvider();

  T get vm =>  _vmStore[_vm];

  of(dynamic widget,T vm){
     if(_vmStore[vm.hashCode] !=null){
       _vmStore[vm.hashCode].clear();
     }
     _vmStore[vm.hashCode]=vm;
  }

}