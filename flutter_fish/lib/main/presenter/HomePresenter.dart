
import 'package:flutter_fish/common/base/Mvp.dart';
import 'package:flutter_fish/common/network/core/HInterface.dart';

import 'package:flutter_fish/main/contract/HomeContract.dart';
import 'package:flutter_fish/main/model/HttpProxy.dart';

class HomePresenter extends BasePresenter<View> implements Presenter {

  HomePresenter(View view) : super(view);

  @override
  void start() {}

  @override
  void getBannerList(){
    view.showLoading();
    HttpProxy.getBannerList((int state,dynamic data){
      view.closeLoading();
      if(state==HState.success){
        view.renderPage(data);
      }else{
        view.showError(msg:data.toString());
      }
    });
  }

}
