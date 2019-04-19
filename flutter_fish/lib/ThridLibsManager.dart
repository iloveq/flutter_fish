import 'package:flutter_fish/common/core/HttpUtils.dart';
import 'common/network/MyHAdapter.dart';
import 'common/utils/LogUtils.dart';

class TDelegate{

  void setup(){}

  void release(){}

}

class ThirdLibsManager implements TDelegate{

  static final ThirdLibsManager _instance = new ThirdLibsManager._internal();

  static ThirdLibsManager get() => _instance;

  factory ThirdLibsManager() => _instance;

  ThirdLibsManager._internal();

  @override
  void release() {
  }

  @override
  void setup() {
     HttpUtils.get().setAdapter(MyAdapter());
     Log.setEnable(true);
  }
 

}