import 'package:path/path.dart';

class BaseViewModel{

}


class ModelProvider<T extends BaseViewModel>{

  T _vm;
  Map<int,T> _map = Map();

  ModelProvider(this._vm){
    _map[_vm.hashCode] = _vm;
  }

  T get vm =>  _map[_vm];

  of(Context ctx){

  }

  subscribe(){

  }

}