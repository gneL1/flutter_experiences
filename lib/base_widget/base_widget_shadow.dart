import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

class BaseWidgetShadow extends StatefulWidget {
  BaseWidgetShadow({ Key key }) : super(key: key);

  @override
  BaseWidgetShadowState createState() => new BaseWidgetShadowState();
}

class BaseWidgetShadowState extends State<BaseWidgetShadow> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shadow'),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[

              //只设置blurRadius
              _item(
                boxShadow: [
                  BoxShadow(
                    color: Colors.orange[100],
                    offset: Offset(10, 10),
                    blurRadius: 10
                  )
                ]
              ),

              //只设置spreadRadius
              _item(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.orange[100],
                        offset: Offset(10, 10),
                        spreadRadius: 10
                    )
                  ]
              ),

              //四边都有阴影
              _item(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.orange[100],
                        offset: Offset(10, 10),
                        blurRadius: 10
                    ),

                    BoxShadow(
                        color: Colors.orange[100],
                        offset: Offset(-10, -10),
                        blurRadius: 10
                    ),

                    BoxShadow(
                        color: Colors.orange[100],
                        offset: Offset(10, -10),
                        blurRadius: 10
                    ),

                    BoxShadow(
                        color: Colors.orange[100],
                        offset: Offset(-10, 10),
                        blurRadius: 10
                    ),
                  ]
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _item({List<BoxShadow> boxShadow,EdgeInsetsGeometry margin = const EdgeInsets.all(24)}){
    return Container(
      margin: margin,
      width: ScreenUtil().setWidth(300),
      height: ScreenUtil().setHeight(300),
      decoration: BoxDecoration(
        boxShadow: boxShadow,
        border: Border.all(color: Colors.grey,width: 2),
        borderRadius: BorderRadius.circular(4)
      ),
    );
  }
}