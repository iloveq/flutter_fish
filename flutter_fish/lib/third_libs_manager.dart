
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'common/network/dio_adapter.dart';

import 'common/network/http_utils.dart';
import 'common/utils/log_utils.dart';
import 'common/utils/toast_utils.dart';

class TDelegate{

  void setup(){}

  void release(){}

  void adapterScreen(context){}

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
     ToastUtils.setEnable(true);
  }

  void adapterScreen(context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
  }
 

}