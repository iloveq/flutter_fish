import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Constants {
  static final int onPrepare = 0;
  static final int onStart = 1;
  static final int onComplete = 2;
  static final int onLoading = 3;
}

class StateListener {
  void onPrepare() {}

  void onStart() {}

  void onRefreshComplete() {}

  void onRefreshLoading() {}

  void onStateChange(int status) {}
}



class RefreshHeader extends RefreshIndicator implements StateListener {




  @override
  void onPrepare() {
    // TODO: implement onPrepare
  }

  @override
  void onRefreshComplete() {
    // TODO: implement onRefreshComplete
  }

  @override
  void onRefreshLoading() {
    // TODO: implement onRefreshLoading
  }

  @override
  void onStart() {
    // TODO: implement onStart
  }

  @override
  void onStateChange(int status) {
    // TODO: implement onStateChange
  }
}

class LoadMoreFooter extends Container implements StateListener {
  @override
  void onPrepare() {
    // TODO: implement onPrepare
  }

  @override
  void onRefreshComplete() {
    // TODO: implement onRefreshComplete
  }

  @override
  void onRefreshLoading() {
    // TODO: implement onRefreshLoading
  }

  @override
  void onStart() {
    // TODO: implement onStart
  }

  @override
  void onStateChange(int status) {
    // TODO: implement onStateChange
  }
}

class OnRefreshListener {
  void onRefresh() {}
}

class OnLoadMoreListener {
  void onLoadMore() {}
}

class PtrGesturesHelper {
  var _offset;
  double lastDownY;
  ScrollController _scrollController;
  double downY = 0.0;

  PtrGesturesHelper()
      : _offset = 0.0,
        lastDownY = 0.0 {
    _scrollController = new ScrollController(initialScrollOffset: this._offset);
  }

  ScrollController get createController => _scrollController==null?new ScrollController(initialScrollOffset: 0.0):_scrollController;
}

class PtrContainer extends StatefulWidget {
  final Container header;
  final Widget body;
  final Container footer;
  final OnLoadMoreListener loadMoreListener;
  final OnRefreshListener refreshListener;

  PtrContainer({this.header, this.body, this.footer, this.loadMoreListener,
      this.refreshListener});

  @override
  State<StatefulWidget> createState() =>
      PtrContainerState(
          header, body, footer, loadMoreListener, refreshListener);
}

class PtrContainerState extends State<PtrContainer> {
  PtrGesturesHelper helper = new PtrGesturesHelper();
  Container header;
  Widget body;
  Container footer;
  final OnLoadMoreListener loadMoreListener;
  final OnRefreshListener refreshListener;
  double downY;
  double lastDownY = 0.0;
  double lastListLength = 0.0;
  List<Widget> slivers;
  bool isLoadMore;
  bool isRefresh;
  int itemCount;

  PtrContainerState(this.header, this.body, this.footer,
      this.loadMoreListener, this.refreshListener);

  @override
  Widget build(BuildContext context) {
    assert(this.body != null);
    Widget current;
    List<Widget> widgets = [];
    if (current == null) {
      if (header != null) {
        widgets.add(header);
      }
      widgets.add(buildBody(body));
      if (footer != null) {
        widgets.add(footer);
      }
      current = new Container(
        child: Listener(onPointerDown: (event) {
          var position = event.position.distance;
          downY = position;
        }, onPointerMove: (event) {
          var position = event.position.distance;
          var ret = position - lastDownY;
          if (ret > 0) {
            if (helper.lastDownY == 0) refreshListener.onRefresh();
            print(111);
          } else {
            var scrollExtent = helper.createController.position.maxScrollExtent;
            var result = helper.createController.offset +
                (position - downY).abs();
            if (result >= scrollExtent) {
              lastListLength = scrollExtent;
              loadMoreListener.onLoadMore();
              print(222);
            }
            helper.lastDownY = result;
          }
          lastDownY = position;
        },
          child: new Column(
            children: widgets,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,

          ),
        ),
      );
    }
    return current;
  }

  Widget buildBody(Widget body) {
    if (body is ScrollView) {
      // ignore: invalid_use_of_protected_member
      slivers = new List.from(body.buildSlivers(context), growable: true);

      // 判断是否为加载更多
      if (isLoadMore) {
        if (body.semanticChildCount == null) {
          new Future.delayed(const Duration(milliseconds: 100), () {

          });
        } else if (body.semanticChildCount > this.itemCount) {
          new Future.delayed(const Duration(milliseconds: 100), () {

          });
        } else {
          new Future.delayed(const Duration(milliseconds: 100), () {

          });
        }
        isLoadMore = false;
      }
      // 记录列表项
      this.itemCount = body.semanticChildCount;
    } else {
      slivers = new List<Widget>();
      slivers.add(SliverList(delegate: SliverChildListDelegate(<Widget>[body])));
    }

    // 构建列表
    var listChild = CustomScrollView(
      semanticChildCount: body is ScrollView ? body.semanticChildCount : 1,
      controller: helper.createController,
      slivers: new List.from(slivers, growable: true),
    );

    var listWidget;
    //listWidget = (body == null ? listChild : body.builder());

    return ScrollConfiguration(
      behavior: new ScrollOverBehavior(),
      child: listChild,
    );

  }
}


/// 滚动视图边界光晕
class RefreshBehavior extends ScrollBehavior {
  final bool showLeading;
  final bool showTrailing;
  final Color color;

  RefreshBehavior(
      {this.showLeading: false,
        this.showTrailing: false,
        this.color: Colors.blue});

  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return new GlowingOverscrollIndicator(
      showLeading: showLeading,
      showTrailing: showTrailing,
      child: child,
      axisDirection: axisDirection,
      color: color,
    );
  }
}

/// 回弹效果(仅用于判断类型)
class ScrollOverBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return new GlowingOverscrollIndicator(
      showLeading: false,
      showTrailing: false,
      child: child,
      axisDirection: axisDirection,
      color: Colors.blue,
    );
  }
}