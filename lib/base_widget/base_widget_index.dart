import 'package:flutter/material.dart';

class BaseWidgetIndex extends StatefulWidget {
  BaseWidgetIndex({ Key key }) : super(key: key);

  @override
  BaseWidgetIndexState createState() => new BaseWidgetIndexState();
}

class BaseWidgetIndexState extends State<BaseWidgetIndex> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('基础组件'),
      ),
      body: Column(
        children: <Widget>[

        ],
      ),
    );
  }
}