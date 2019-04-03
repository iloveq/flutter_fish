import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => HomePageState();
}


class HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Text('HomePage'),
    );
  }

}