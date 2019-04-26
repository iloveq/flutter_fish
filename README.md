# flutter_fish

```

npm install -g json-server

json-server --port 2000 bannerList.json

浏览器输入:

<http://localhost:2000/bannerList>

class HttpConstants{
  // 运行在 android 模拟器时 本地回环地址要改成 10.0.2.2
  //static final serverAddress = "http://10.0.2.2:2000/";
  static final serverAddress = "http://127.0.0.1:2000/";
  ///******************************* actions ****************************************/
  static final String bannerList = serverAddress + "bannerList";
}
```

#### flutter项目中可以做的一些基础工作

既然要开发 flutter 工程，我们必然要做一些基础工作。比如 mvp，网络请求，工具类，基础UI 等等的封装和抽取

#### flutter 中 mvp 和 网络框架的封装及其使用：

##### 1：mvp 

web ->  service -> dao

view -> presenter -> model

mvp 此类设计可以把工程易变的和不容易变的分离，是为解耦。关于为什么要解耦，如何解耦，什么是解耦 ... 我们暂且不聊～

[首先有基于 google Android Architecture =>https://github.com/googlesamples/android-architecture](https://github.com/googlesamples/android-architecture)

其次是 mvp 的实现： 遵守 contract 面向接口编程思想

HomeContract.dart
```
class View extends ILoadingView{
}
class Presenter extends IPresenter{
  void getBannerList(){}
}
```
HomePresenter.dart 负责业务相关实现
```
class HomePresenter extends BasePresenter<View> implements Presenter {
  HomePresenter(View view) : super(view);  
  @override
  void start() {}
  @override
  void getBannerList() {
    view.showLoading();
    // 方式一
    HttpProxy.getBannerList((int state, dynamic data) {
      if (state == HState.success) {
        view.closeLoading();
        List<Banner> bannerList = new GetBannerListJsonParser().parse(data);
        view.renderPage(bannerList);
      } else {
        view.closeLoading();
        view.showError(data.toString());
      }
    });
//    方式二
//    HttpProxy.getBannerList().then((Response res) {
//      view.closeLoading();
//      List<Banner> bannerList =
//          new GetBannerListJsonParser().parse(res.data);
//      view.renderPage(bannerList);
//    }).catchError((e) {
//      view.closeLoading();
//      view.showError(e.toString());
//    });
  }
}
```
方式1和方式2的两种网络请求我们一会儿再看，接下来我们看 👇

mvp 封装：

最顶层基类，我们遵守可扩展原则

IPresenter.dart 和 IView.dart
```
class IPresenter{}
class IView{}
```
对于app常见页面场景 ILoadingView.dart 和 ILoadingListView.dart
```
class ILoadingView extends IView{
  void showLoading(){}
  void closeLoading(){}
  void renderPage(Object o){}
  void reload(){}
  void showError(String msg){}
  void showDisconnect(){}
}
class ILoadingListView extends ILoadingView{
  void showEmpty(){}
}
```
关于命名，dart 没有 interface 我就以 I 开头了，至于抽象类建议 Abs 开头

如何把 view 和 presenter 关联呢，看 BasePresenter.dart
```
abstract class BasePresenter<T> {
  T view;
  BasePresenter(this.view);
  void start();
  void stop() {
    this.view = null;
  }
}
```

关于这样写，也是受 google 的那些 sample 影响，至少有一个 start () 方法，可以用可以不用，个人习惯，不过还是建议，有构造就有析构 有始有终，至于指定泛型，好处呢，编译前里可以找到 view 的方法并且省去一些 view 绑定 presenter 代码的编写。dartVm没有泛型插除，带来自由的同时，也带来了危险，不过 dynamic 的类型真的很好。

##### 2：网络请求二次封装

core 是存粹的，不应该引入任何网络请求的库，这样才能做到通用性，通过 Adapter 来做不同网络框架的适配

core 里 HttpUtils 的使用：初始化适配器

main.dart  一些个人想法，所有 widget 组成的 page 都应有 state ，stateless 可以做一些自定义基础控件和无交互的UI展示

```
void main() {
  ThirdLibsManager.get().setup();
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyAppState();
}
class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    // ...
  }
  @override
  void dispose() {
    super.dispose();
    // 这个回调放这可能不对，感觉要用 channel 建立 dart 和 native(and/ios) 通道
    ThirdLibsManager.get().release();
  }
}
```
```
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
  void release() {}
  @override
  void setup() {
     // 设置适配器
     HttpUtils.get().setAdapter(DioAdapter());
     Log.setEnable(true);
  }
}
```

设置适配器以后的工作就是之前我们看到 HomePresenter.dart 里的那样了

封装：

1:interface 一些接口和协议，可以看出 dart 语言灵活的魅力，一千个读者一千个哈姆雷特，总有一种写法适合你；

2:utils 一个入口;

3:ctx 一个抽象的全局的结构体；

HInterface.dart
```
import 'dart:async';
import 'RequestCtx.dart';
abstract class JsonParser<T> {
  T parse(String jsonStr);
}
abstract class HAdapter {
  Future<dynamic> request(RequestCtx ctx);
}
// a transformer
typedef transformer = String Function(String original);
// a callback
typedef dataCallback = Function(int state, dynamic data);
class HState{
  static final int success = 1;//成功
  static final int fail = 0;//失败
  static final int intercept = -1;//中断
}
```

RequestCtx.dart 包含了网络请求和响应的所有必要的结构组成
```
import 'dart:io';
import 'HInterface.dart';
class HConstants {
  static final String get = "get";
  static final String post = "post";
  static final int timeout = 15000;
}
class RequestCtx {
  String _url;
  String _method;
  int _timeout;
  ContentType _contentType;
  dynamic _responseType;
  Map<String, dynamic> _paramMap;
  Map<String, dynamic> _headerMap;
  Map<String, dynamic> _bodyMap;
  int _retryCount;
  dynamic _transformer;
  List<dynamic> _interceptors;
  dataCallback _callback;
  // ...  太多了，就不写了，可以 看github 👆article start part
}
```

上面看到有2种网络请求的书写方式呢？我们看 HttpUtils 入口和  Adatper 接口的实现类：

HttpUtils.dart  某些人写的网络框架做了更深的 future 的封装，我们就不需要 callback，没做的，我们要在 adapter 的实现类里手动回调，这也是 callback 函数的意义。

```
class HttpUtils{
  HAdapter _adapter;
  // 省略 单列模式 的固定书写
  setAdapter(HAdapter adapter){
    this._adapter = adapter;
  }
  Future<dynamic> req(String url, {String method,int timeout,
    Map<String, dynamic> header,
    Map<String, dynamic> params,
    Map<String, dynamic> body,
    Transformer transformer,
    List<Interceptor> interceptors,
    dataCallback callback
    }) {
    assert(_adapter!=null);//没有做adapter的实现是无法去请求的 asset 很强大
    try {
      RequestCtx ctx = new Builder()
          .setUrl(url)
          .setMethod(method)
          .setHeaderMap(header)
          .setTimeout(timeout)
          .setParams(params)
          .setResponseType(ResponseType.plain)
          .setBodyMap(body)
          .setTransformer(transformer)
          .setInterceptors(interceptors)
          .setDataCallback(callback)
          .build();
      return _adapter.request(ctx);
      
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  String wrapUrlByParams(String url,Map<String, dynamic> params){
    String ret = url;
    if (params != null && params is Map && params.isNotEmpty) {
      StringBuffer sb = new StringBuffer("?");
      params.forEach((key, value) {
        sb.write("$key" + "=" + "$value" + "&");
      });
      String paramStr = sb.toString();
      paramStr = paramStr.substring(0, paramStr.length - 1);
      ret += paramStr;
    }
    return ret;
  }
}
```

DioAdapter.dart 这里先写一个 dio 的适配器，dynamic 的好处大家可以体会到，要实现其他的网络框架可以自己适配：
```
class DioAdapter implements HAdapter{

  Dio _dio;

  DioAdapter() {
    _dio = new Dio();
  }

  @override
  Future<Response<dynamic>> request(RequestCtx ctx) async {

    Future<Response<dynamic>> response;

    _dio.options = new BaseOptions(
        connectTimeout: ctx.timeout == null ? HConstants.timeout : ctx.timeout,
        receiveTimeout: ctx.timeout == null ? HConstants.timeout : ctx.timeout,
        headers: ctx.headerMap==null?{HttpHeaders.userAgentHeader: "dio-2.1.0"}:ctx.headerMap,
        contentType: ctx.contentType == null ? ContentType.json : ctx.contentType,
        responseType: ctx.responseType == null ? ResponseType.json : ctx.responseType,
        validateStatus: (status) {
          return status >= 200 && status < 300 || status == 304;
        }
    );

    if (ctx.transformer != null) {
      _dio.transformer = ctx.transformer;
    }

    if (ctx.interceptors != null && ctx.interceptors.isNotEmpty) {
      for (var value in ctx.interceptors) {
        _dio.interceptors.add(value);
      }
    }

    String url = HttpUtils.get().wrapUrlByParams(ctx.url, ctx.paramMap);

    switch (ctx.method) {
      case "get":
        response = _dio.get(url);
        break;
      case "post":
        response = _dio.post(url, data: ctx.bodyMap);
        break;
      default:
        response = _dio.get(url);
    }

    if(ctx.callback!=null){
      response.then((response){
        // can by some response.statusCode to make some regex
        ctx.callback(HState.success,response.data);
      }).catchError((e){
        ctx.callback(HState.fail,e);
      });
    }

    return response;
  }
}
```




