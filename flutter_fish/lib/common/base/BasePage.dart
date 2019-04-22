import 'package:flutter/widgets.dart';

abstract class BasePage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => getState();

  getState();

}

abstract class BasePageState<T extends BasePage> extends State<T>{

  @override
  Widget build(BuildContext context) {
    onAttachedBuilder(context);
    return onBuildPage(context);
  }

  void onAttachedBuilder(BuildContext context);

  Widget onBuildPage(BuildContext context);

}