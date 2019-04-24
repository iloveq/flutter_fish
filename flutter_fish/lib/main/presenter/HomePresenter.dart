import 'package:flutter_fish/common/core/HInterface.dart';
import 'package:flutter_fish/common/mvp/BasePresenter.dart';
import 'package:flutter_fish/main/contract/HomeContract.dart';
import 'package:flutter_fish/main/model/HttpProxy.dart';
import 'package:flutter_fish/main/model/bean/Banner.dart';
import 'package:flutter_fish/main/model/jsonParser/GetBannerListJsonParser.dart';

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
        List<Banner> bannerList = new GetBannerListJsonParser().parse(data);
        view.renderPage(bannerList);
      }else{
        view.showError(msg:data.toString());
      }
    });
  }

}
