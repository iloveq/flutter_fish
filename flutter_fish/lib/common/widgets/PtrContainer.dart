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

class RefreshHeader extends Container implements StateListener {
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

class PtrHelper {
  var _offset;
  double lastDownY;
  ScrollController scrollController;
  double downY = 0.0;

  PtrHelper()
      : _offset = 0.0,
        lastDownY = 0.0 {
    scrollController = new ScrollController(initialScrollOffset: this._offset);
  }
}

class PtrContainer extends StatefulWidget {
  final RefreshHeader header;
  final Widget body;
  final LoadMoreFooter footer;
  final OnLoadMoreListener loadMoreListener;
  final OnRefreshListener refreshListener;

  PtrContainer(this.header, this.body, this.footer, this.loadMoreListener,
      this.refreshListener);

  @override
  State<StatefulWidget> createState() => PtrContainerState(
      header, body, footer, loadMoreListener, refreshListener);
}

class PtrContainerState extends State<PtrContainer> {
  PtrHelper helper = new PtrHelper();
  RefreshHeader header;
  Widget body;
  LoadMoreFooter footer;
  final OnLoadMoreListener loadMoreListener;
  final OnRefreshListener refreshListener;
  double downY;
  double lastDownY = 0.0;
  double lastListLength = 0.0;

  PtrContainerState(this.header, this.body, this.footer,
      this.loadMoreListener, this.refreshListener);

  @override
  Widget build(BuildContext context) {
    var listener = new Listener(onPointerDown: (event) {
      var position = event.position.distance;
      downY = position;
    }, onPointerMove: (event) {
      var position = event.position.distance;
      var ret = position - lastDownY;
      if (ret > 0) {
        if (helper.lastDownY == 0) refreshListener.onRefresh();
        print(111);
      } else {
        var scrollExtent = helper.scrollController.position.maxScrollExtent;
        var result = helper.scrollController.offset + (position - downY).abs();
        if (result >= scrollExtent) {
          lastListLength = scrollExtent;
          loadMoreListener.onLoadMore();
          print(222);
        }
        helper.lastDownY = result;
      }
      lastDownY = position;
    });
    assert(this.body != null);
    Widget current;
    List<Widget> widgets = [listener];
    if (current == null) {
      if (header != null) {
        widgets.add(header);
      }
      widgets.add(body);
      if (footer != null) {
        widgets.add(footer);
      }
      current = new Column(
        children: widgets,
      );
    }
    return current;
  }
}
