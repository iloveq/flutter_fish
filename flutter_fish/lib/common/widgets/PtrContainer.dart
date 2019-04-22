import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

typedef RefreshCallback = Future<void> Function();
typedef LoadMoreCallback = Future<void> Function();

typedef OnFooterStatusChange(FooterStatus status);
typedef OnHeaderStatusChange(HeaderStatus status);
typedef Widget TransitionBuilder(BuildContext context, Widget child, ScrollController scrollController);

enum FooterStatus {
  PREPARE,START,LOADING,COMPLETE,RELEASE
}

enum HeaderStatus{
  PREPARE,START,REFRESHING,COMPLETE,RELEASE
}

class RefreshHeaderListener {
  void onPrepare(){}
  void onStart(){}
  void onRefreshComplete(){}
  void onRefreshing(){}
  void onRelease(){}
  void updateHeight(double height){}
}

class LoadMoreFooterListener {
  void onPrepare(){}
  void onStart(){}
  void onLoadMoreComplete(){}
  void onLoading(){}
  void onRelease(){}
  void updateHeight(double height){}
}


abstract class RefreshHeader extends StatefulWidget {
  final double refreshHeight;
  final bool isFloat;
  final int finishDelay;
  GlobalKey<RefreshHeaderState> getKey() {
    return this.key;
  }

  RefreshHeader({
    @required GlobalKey<RefreshHeaderState> key,
    this.refreshHeight: 70.0,
    this.isFloat: false,
    this.finishDelay: 1000}
    ):super(key:key){
    assert(this.key!=null);
  }
}

abstract class RefreshHeaderState<T extends RefreshHeader> extends State<T> implements RefreshHeaderListener{

  HeaderStatus refreshHeaderStatus = HeaderStatus.PREPARE;
  double height = 0.0;

  @override
  void updateHeight(double height) {
    this.height = height;
  }

  @override
  void onPrepare() {
    this.refreshHeaderStatus = HeaderStatus.RELEASE;
  }

  @override
  void onStart() {
    this.refreshHeaderStatus = HeaderStatus.START;
  }

  @override
  void onRefreshing() {
    this.refreshHeaderStatus = HeaderStatus.REFRESHING;
  }

  @override
  void onRefreshComplete() {
    this.refreshHeaderStatus = HeaderStatus.COMPLETE;
  }

  @override
  void onRelease() {
    this.refreshHeaderStatus = HeaderStatus.RELEASE;
  }

}

class RefreshHeaderImpl extends RefreshHeader{

  final double refreshHeight;
  final int finishDelay;
  final RefreshHeaderListener listener;

  RefreshHeaderImpl({
    @required GlobalKey<RefreshHeaderState> key,
    @required this.listener,
    this.refreshHeight: 70.0,
    this.finishDelay: 1000
  }):super(key:key,
      refreshHeight: refreshHeight,
      finishDelay: finishDelay){
      assert(listener != null);
  }

  @override
  State<StatefulWidget> createState()=>RefreshHeaderImplState();

}

class RefreshHeaderImplState extends RefreshHeaderState<RefreshHeaderImpl>{
  @override
  Widget build(BuildContext context) {
    return new Container();
  }

  @override
  void onPrepare() {
    super.onPrepare();
    widget.listener.onPrepare();
  }

  @override
  void onStart() {
    super.onStart();
    widget.listener.onStart();
  }

  @override
  void onRefreshing() {
    super.onRefreshing();
    widget.listener.onRefreshing();
  }

  @override
  void onRefreshComplete() {
    super.onRefreshComplete();
    widget.listener.onRefreshComplete();
  }

  @override
  void onRelease() {
    super.onRelease();
    widget.listener.onRelease();
  }

  @override
  void updateHeight(double height) {
    super.updateHeight(height);
    widget.listener.updateHeight(height);
  }

}


abstract class LoadMoreFooter extends StatefulWidget {
  final double footerHeight;
  final bool isFloat;
  final int finishDelay;
  GlobalKey<RefreshHeaderState> getKey() {
    return this.key;
  }

  LoadMoreFooter({
    @required GlobalKey<RefreshHeaderState> key,
    this.footerHeight: 70.0,
    this.isFloat: false,
    this.finishDelay: 1000}
      ):super(key:key){
    assert(this.key!=null);
  }
}

abstract class LoadMoreFooterState<T extends LoadMoreFooter> extends State<T> implements LoadMoreFooterListener{

  FooterStatus loadMoreFooterStatus = FooterStatus.PREPARE;
  double height = 0.0;

  @override
  void updateHeight(double height) {
    this.height = height;
  }

  @override
  void onPrepare() {
    this.loadMoreFooterStatus = FooterStatus.RELEASE;
  }

  @override
  void onStart() {
    this.loadMoreFooterStatus = FooterStatus.START;
  }

  @override
  void onLoading() {
    this.loadMoreFooterStatus = FooterStatus.LOADING;
  }

  @override
  void onLoadMoreComplete() {
    this.loadMoreFooterStatus = FooterStatus.COMPLETE;
  }

  @override
  void onRelease() {
    this.loadMoreFooterStatus = FooterStatus.RELEASE;
  }

}

class LoadMoreFooterImpl extends LoadMoreFooter{

  final double footerHeight;
  final int finishDelay;
  final LoadMoreFooterListener listener;

  LoadMoreFooterImpl({
    @required GlobalKey<RefreshHeaderState> key,
    @required this.listener,
    this.footerHeight: 70.0,
    this.finishDelay: 1000
  }):super(key:key,
      footerHeight: footerHeight,
      finishDelay: finishDelay){
    assert(listener != null);
  }

  @override
  State<StatefulWidget> createState()=>LoadMoreFooterImplState();

}

class LoadMoreFooterImplState extends LoadMoreFooterState<LoadMoreFooterImpl>{
  @override
  Widget build(BuildContext context) {
    return new Container();
  }

  @override
  void onPrepare() {
    super.onPrepare();
    widget.listener.onPrepare();
  }

  @override
  void onStart() {
    super.onStart();
    widget.listener.onStart();
  }

  @override
  void onLoading() {
    super.onLoading();
    widget.listener.onLoading();
  }

  @override
  void onLoadMoreComplete() {
    super.onLoadMoreComplete();
    widget.listener.onLoadMoreComplete();
  }

  @override
  void onRelease() {
    super.onRelease();
    widget.listener.onRelease();
  }

  @override
  void updateHeight(double height) {
    super.updateHeight(height);
    widget.listener.updateHeight(height);
  }

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
  final RefreshHeader header;
  final Widget body;
  final LoadMoreFooter footer;
  final LoadMoreCallback loadMoreListener;
  final RefreshCallback refreshListener;
  final TransitionBuilder listBuilder;

  const PtrContainer({this.header, @required this.body, this.footer, this.loadMoreListener,
      this.refreshListener,this.listBuilder});

  @override
  State<StatefulWidget> createState() =>
      PtrContainerState(header, body, footer, loadMoreListener, refreshListener,listBuilder);
}

class PtrContainerState extends State<PtrContainer> {

  PtrGesturesHelper helper = new PtrGesturesHelper();

  RefreshHeader header;
  Widget body;
  final LoadMoreFooter footer;
  final LoadMoreCallback loadMoreListener;
  final RefreshCallback refreshListener;
  final TransitionBuilder listBuilder;
  double downY;
  double lastDownY = 0.0;
  double lastListLength = 0.0;
  List<Widget> slivers;
  bool isLoadMore;
  bool isRefresh;
  int itemCount;

  PtrContainerState(this.header, this.body, this.footer,
      this.loadMoreListener, this.refreshListener,this.listBuilder);

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
            if (helper.lastDownY == 0) {
              header.getKey().currentState.onRefreshing();
              print("refresh");
            }
          } else {
            var scrollExtent = helper.createController.position.maxScrollExtent;
            var result = helper.createController.offset +
                (position - downY).abs();
            if (result >= scrollExtent) {
              lastListLength = scrollExtent;

              print("loadmore");
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

    //var listWidget;
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