import 'package:flutter/material.dart';

class CustomWidgetIndex extends StatefulWidget {
  CustomWidgetIndex({ Key key }) : super(key: key);

  @override
  CustomWidgetIndexState createState() => new CustomWidgetIndexState();
}

class CustomWidgetIndexState extends State<CustomWidgetIndex> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('自定义组件'),
      ),
      body: Column(
        children: <Widget>[

        ],
      ),
    );
  }
}