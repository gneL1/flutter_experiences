import 'package:flutter/material.dart';

class BaseWidgetTextView extends StatefulWidget {
  BaseWidgetTextView({ Key key }) : super(key: key);

  @override
  BaseWidgetTextViewState createState() => new BaseWidgetTextViewState();
}

class BaseWidgetTextViewState extends State<BaseWidgetTextView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TextView'),
      ),
    );
  }
}