import 'package:flutter_fish/common/constants/HttpConstants.dart';
import 'package:flutter_fish/common/network/HttpUtils.dart';

class HttpProxy {



  getBannerList() {

    RequestCtx ctx = new Builder()
        .setUrl(HttpConstants.serverAddress)
        .setMethod(HConstants.get)

        .build();

    HttpUtils.get().request(ctx);

  }
}
