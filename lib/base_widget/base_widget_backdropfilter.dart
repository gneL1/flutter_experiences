import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutterexperiences/R.dart';

class BaseWidgetDropBackFilter extends StatefulWidget {
  BaseWidgetDropBackFilter({ Key key }) : super(key: key);

  @override
  BaseWidgetDropBackFilterState createState() => new BaseWidgetDropBackFilterState();
}

class BaseWidgetDropBackFilterState extends State<BaseWidgetDropBackFilter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DropbackFilter'),
      ),
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: ScreenUtil().setWidth(600),
                height: ScreenUtil().setHeight(600),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(R.intPic.int_pic_01)
                  ),
                  color: Colors.red[100],
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaY: 10,sigmaX: 10),
                  child: Container(
                    width: 200,
                    height: 200,
                    color: Colors.greenAccent,
                  ),
                ),
              ),
              Container(
                width: ScreenUtil().setWidth(400),
                height: ScreenUtil().setHeight(400),
                color: Colors.orange[100],
                child: Image(image: AssetImage(R.intPic.int_pic_01)),
              )
            ],
          ),
        ),
      ),
    );
  }
}