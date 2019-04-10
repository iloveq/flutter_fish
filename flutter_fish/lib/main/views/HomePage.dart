import 'package:flutter/widgets.dart';
import 'package:flutter_fish/main/contract/HomeContract.dart';

class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => HomePageState();
}


class HomePageState extends State<HomePage> implements View{

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Text('HomePage'),
    );
  }

  @override
  void closeLoading() {
    // TODO: implement closeLoading
  }

  @override
  void reload() {
    // TODO: implement reload
  }

  @override
  void renderPage(Object o) {
    // TODO: implement renderPage
  }

  @override
  void showDisconnect() {
    // TODO: implement showDisconnect
  }

  @override
  void showError(String msg) {
    // TODO: implement showError
  }

  @override
  void showLoading() {
    // TODO: implement showLoading
  }

}