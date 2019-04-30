
import 'common/network/dio_adapter.dart';
import 'package:flutter_fish/common/network/http_utils.dart';
import 'common/utils/log_utils.dart';

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
     HttpUtils.get().setAdapter(DioAdapter());
     Log.setEnable(true);
  }
 

}