// maybe a interface or a father object
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
    // TODO: implement release
  }

  @override
  void setup() {
    // TODO: implement setup
  }
 

}