class Constants{
  static final int onPrepare = 0;
  static final int onStart = 1;
  static final int onComplete = 2;
  static final int onLoading = 3;
}


class StateListener{

  void onPrepare(){}

  void onStart(){}

  void onRefreshComplete(){}

  void onRefreshLoading(){}

  void onStateChange(int status){}

}

class RefreshHeader extends StateListener{

}

class LoadMoreFooter extends StateListener{

}

class RefreshAndLoadMoreContainer{




}



