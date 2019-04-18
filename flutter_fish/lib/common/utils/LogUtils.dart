class Log {

  static bool isOpen = false;

  static setEnable(bool b){
    isOpen = b;
  }

  static e(msg){
    if(isOpen)
      print(msg);
  }

  static d(msg){
    if(isOpen)
      print(msg);
  }
}