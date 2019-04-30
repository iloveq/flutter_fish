
import 'package:flutter_fish/common/base/mvp.dart';
import 'package:flutter_fish/common/network/http_utils.dart';
import 'package:flutter_fish/main/contract/home_contract.dart';
import 'package:flutter_fish/main/model/http_proxy.dart';

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
