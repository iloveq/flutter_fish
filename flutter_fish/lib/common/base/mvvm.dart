
/// 负责 view - action -> model  model - action -> view
abstract class Action{

}

/// viewModel 实现 action 接口 通过 viewModel.xxxFun() 使用 action
abstract class BaseViewModel implements Action {

  BaseViewModel();

  clear(){}

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